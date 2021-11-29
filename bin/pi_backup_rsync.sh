firebase_person_id(){
	cat ~/playin/custom_bashrc/gitignore/firebase_person_id
}

firebase_token(){
	cat ~/playin/custom_bashrc/gitignore/firebase_token
}

piip(){
	pi_ip=$(curl "https://node.andbrant.com/database?person_id=$(firebase_person_id)&token=$(firebase_token)&data_location=devices.exposed_pi.public_ip_v4"| awk '{print substr($0, 2, length($0) - 2)}')
	echo $pi_ip
}

echo "start"
date
log_dir="$HOME/rsync_logs"
mkdir -p $log_dir
rsync -v -a --delete --log-file="$log_dir/$(date).log" -e 'ssh -p 23' pi@$(piip):'/media/pi/TOSHIBA\ EXT/*' /media/pi/TOSHIBA\ EXT/exposed_pi/
rsync -v -a -e 'ssh -p 23' $log_dir/* pi@$(piip):"/media/pi/TOSHIBA\ EXT/rsync_logs/pi3b-1"
#sftp -P 23 pi@$(piip):"/media/pi/TOSHIBA\ EXT/rsynclog/$(date)" <<< $'put /home/pi/rsynclog.txt'
date
echo "done"
