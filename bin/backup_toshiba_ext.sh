listFunctions(){
	declare -F | awk '{print $NF}'
	exit
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

prune(){
	list

	echo ""

	echo "prune"
	borg prune -v --list --keep-daily=7 --keep-weekly="5" --keep-monthly="12" --keep-yearly="2"
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
		send_push 'Borg report' 'No problems found';
	else
		send_push 'Borg report' 'Problems ARE found!!!';
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


if [ "$(echo $1 | grep 'listFunctions' | wc -l)" = "1" ]; then
    $1
elif [ "" != "$1" ]; then

   export BW_SESSION="$(cat $bashrc_folder/gitignore/BW_SESSION)"
   export PASSWORD_ID=$(cat $bashrc_folder/gitignore/borg_pw_id)

   export BORG_PASSPHRASE=$( bw get item $PASSWORD_ID | jq -r .login.password )

   if [ -z ]; then
	echo $BORG_PASSPHRASE
	echo 'backup did not finish; no borg passphrase';
	exit -1;
   fi

   SRC_DIR="/mnt/toshiba_ext/hold_on_to/"

   export BORG_REPO="toshiba_backup:/mnt/my_passport/toshiba_ext.borg"
   ENCRYPTION="repokey"

    $1
else
	echo "no function provided. Try:"
	listFunctions
fi

