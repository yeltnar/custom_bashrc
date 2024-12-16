# test restoring volumes to podman on nixos machine 

set -x;

if [ -z $BORG_PASSPHRASE ]; then
  printf "need to export BORG_PASSPHRASE=\n";
  exit;
fi

export MOUNT_PATH="/tmp/docker_volumes/mnt";
export BACKUP_PATH="/var/lib/docker/volumes";
export RESTORE_PATH="/home/drew/.local/share/containers/storage/volumes";

# TODO dont hard code this 
export BORG_REPO="/tmp/mini/mnt/2t_toshiba/docker_volumes.borg";

mkdir -p "$MOUNT_PATH";
borg mount :: "$MOUNT_PATH"

export LATEST_DATE="$(ls -t $MOUNT_PATH | head -n1)"

cd "$MOUNT_PATH/$LATEST_DATE$BACKUP_PATH/"; 
ls | grep -v FsBlock | grep -v metadata | grep -v backup-restore-test | awk '{print "rm -rf $RESTORE_PATH/"$0}' | bash
ls | grep -v FsBlock | grep -v metadata | grep -v backup-restore-test | awk '{print "cp -ar " $0" $RESTORE_PATH/"}' | bash

# as root 
# chown -R 100999:users [new volume dirs]
ls | grep -v FsBlock | grep -v metadata | grep -v backup-restore-test | awk '{print "chown -R 100999:users $RESTORE_PATH/"$0}'

# TODO become drew
runuser -u drew -- bash -c "cd $RESTORE_PATH; ls -at | grep -v -E '\.$' | awk '{print \"podman volume create \" $0}' | bash"

cd # move to home dir, to get out of mounted dir (and cause next line to fail)
borg umount "$MOUNT_PATH"

set +x

