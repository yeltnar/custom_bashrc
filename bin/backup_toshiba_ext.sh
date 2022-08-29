if [ "" = "$1" ]; then
    echo "no function provided. Try init, backup, prune, list, or testing"
    exit
fi

export BW_SESSION="$(cat $bashrc_folder/gitignore/BW_SESSION)"
export PASSWORD_ID=$(cat $bashrc_folder/gitignore/borg_pw_id)

export BORG_PASSPHRASE=$( bw get item $PASSWORD_ID | jq -r .login.password )

SRC_DIR="/mnt/toshiba_ext/hold_on_to/"

export BORG_REPO="/mnt/my_passport/toshiba_ext.borg"
ENCRYPTION="repokey"

init(){
	borg init $BORG_REPO --encryption=$ENCRYPTION

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

list(){
	echo "list"
	borg list
}

if [ "" != "$1" ]; then
    $1
else
    echo "no function provided. Try init, backup, prune, list, or testing"
fi

