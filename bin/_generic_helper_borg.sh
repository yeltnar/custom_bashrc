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

# TODO make generic 
prune(){
	list
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
		send_push 'Borg report' "No problems found SRC_DIR=$SRC_DIR";
	else
		send_push 'Borg report' "Problems ARE found!!! SRC_DIR=$SRC_DIR";
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

   if [ -z "$BORG_PASSPHRASE" ]; then
	echo $BORG_PASSPHRASE;
	echo 'backup did not finish; no borg passphrase';
	send_push 'Borg report' "BORG_PASSPHRASE empty SRC_DIR=$SRC_DIR";
	exit -1;
   fi

   $1
else
	echo "no function provided. Try:"
	listFunctions
fi

