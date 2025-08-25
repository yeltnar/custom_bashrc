mkdir -p ~/tmp/uptime_log

date >> ~/tmp/uptime_log/uptime_log.log
uptime >> ~/tmp/uptime_log/uptime_log.log
echo >> ~/tmp/uptime_log/uptime_log.log

cat ~/tmp/uptime_log/uptime_log.log | tail -n 100 > /tmp/uptime_log.log
cat /tmp/uptime_log.log > ~/tmp/uptime_log/uptime_log.log

