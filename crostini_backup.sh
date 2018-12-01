lxc stop penguin --force
lxc publish penguin --alias backup
lxc image export backup $LXD_CONF/backup
lxc file push $LXD_CONF/backup.tar.gz penguin/home/andcbrant/backup.tar.gz
