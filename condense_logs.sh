if [ -n "$log_type" ]; then
    echo "\$log_type found: $log_type"
else
    echo "\$log_type is not set (env var)"
    exit
fi

mkdir /media/pi/TOSHIBA EXT/phone/drew_tasker_logs/master;
mkdir /media/pi/TOSHIBA EXT/phone/drew_tasker_logs/master/$log_type;

cat /media/pi/TOSHIBA\ EXT/phone/drew_tasker_logs/*/$log_type/log.csv | sort | uniq > /media/pi/TOSHIBA\ EXT/phone/drew_tasker_logs/master/$log_type/log.csv
