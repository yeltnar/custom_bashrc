start_time=`date`

listFunctions(){
	declare -F | awk '{print $NF}'
	exit
}

_send_push(){
	
	export topic="`cat $bashrc_folder/gitignore/borg_ntfy_topic`"
	export message_title="$1" 
	export message_content="$2"

	_generic_ntfy_andbrant
	_generic_ntfy_public
}

_send_json_push(){

	if [ -z "$BORG_NAME" ]; then
		BORG_NAME="SRC_DIR=$SRC_DIR";
	fi

	end_time=`date`

	json=`echo {} | jq --arg BORG_NAME "$BORG_NAME" '.BORG_NAME = $BORG_NAME'`
	json=`echo $json | jq --arg start_time "$start_time" '.start_time= $start_time'`
	json=`echo $json | jq --arg end_time "$end_time" '.end_time= $end_time'`
	json=`echo $json | jq --arg msg "$2" '.msg = $msg'`
	json=`echo $json | jq --arg good "$3" '.good = $good'`
	
	_send_push "$1" "$json"
}

test_push(){
	_send_push "test" "message"
}

test_json_push(){
	_send_json_push "test" "message" "true"
}

init(){
	borg init $BORG_REPO --encryption=$ENCRYPTION
}

export_key(){
	borg key export $BORG_REPO 
}

backup(){
	borg create --stats --progress --compression lz4 ::{user}-{now}  $SRC_DIR
	borg info :: --last 1
}

# TODO make generic 
prune(){
	list
	echo "prune"
	borg prune -v --list --keep-daily=7 --keep-weekly="5" --keep-monthly="12" --keep-yearly="2"
}

backup_prune(){
	backup && prune;
}

backup_prune_push(){
	backup_prune && _send_json_push "backup_prune" "good" "true" || _send_json_push "backup_prune" "not so good" "false"
}

check(){
	date
	echo "check"
	borg check -v ::
	date
}


check_report(){
	echo 'tail -f /tmp/borg_check_report.log'
	rm -rf /tmp/borg_check_report.log
	check_res=$(check 2>&1 | tee /tmp/borg_check_report.log)
	no_prob_num=$(echo -e "$check_res" | grep -i 'no problems found' | wc -l)
	if [ 2 -eq $no_prob_num ]; then
		_send_json_push 'Borg report' "No problems found" "true"; 
	else
		_send_json_push 'Borg report' "Problems ARE found!!!" "false";
	fi
	echo $no_prob_num
	echo "$check_res"
}


list(){
	echo "list"
	borg list
}


unmount(){
	mount_point="/tmp/borgmount"
	borg umount $mount_point
}

mount(){
	mount_point="/tmp/borgmount"
	mkdir -p $mount_point
	borg mount :: $mount_point
}

# checks if provided function is in the lit of functions
if [ "$(echo $1 | grep 'listFunctions' | wc -l)" = "1" ]; then
    $1
elif [ "" != "$1" ]; then

   export BORG_PASSPHRASE=$( bw_autologin get item $PASSWORD_ID | jq -r .login.password ) 

   if [ -z "$BORG_PASSPHRASE" ]; then
	echo $BORG_PASSPHRASE;
	echo 'backup did not finish; no borg passphrase';
	_send_push 'Borg report' "BORG_PASSPHRASE empty";
	exit -1;
   fi

   $1
else
	echo "no function provided. Try:"
	listFunctions
fi

