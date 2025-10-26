start_time=`date`

cd /home/pi/playin/minio_client;
/usr/bin/docker compose up >> /home/pi/cron/minio-backup.docker.log 2>&1

_send_json_push(){

	BORG_NAME="backup_pi-minio"
	end_time=`date`

	json=`echo {} | jq --arg BORG_NAME "$BORG_NAME" '.BORG_NAME = $BORG_NAME'`
	json=`echo $json | jq --arg start_time "$start_time" '.start_time= $start_time'`
	json=`echo $json | jq --arg end_time "$end_time" '.end_time= $end_time'`
	json=`echo $json | jq --arg msg "$2" '.msg = $msg'`
	json=`echo $json | jq --argjson good "$3" '.good = $good'`

	echo $json
	
	_send_push "$1" "$json"
}

_send_push(){
	
	# I know... I'm not using borg
	export topic="`cat $bashrc_folder/gitignore/borg_ntfy_topic`"
	export message_title="$1" 
	export message_content="$2"

	_generic_ntfy_andbrant
	#_generic_ntfy_public
}

cat /home/pi/cron/minio-backup.docker.log | grep -q "exited with code 0" && 
	_send_json_push "backup" "good" "true" || 
	_send_json_push "backup" "not so good" "false"

# just keep last lines
cat /home/pi/cron/minio-backup.docker.log | tail -n1000 > /tmp/.minio-backup.docker.log && 
	cat /tmp/.minio-backup.docker.log > /home/pi/cron/minio-backup.docker.log

