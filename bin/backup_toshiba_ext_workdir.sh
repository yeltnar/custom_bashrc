export BW_SESSION="$(cat $bashrc_folder/gitignore/BW_SESSION)"
export PASSWORD_ID=$(cat $bashrc_folder/gitignore/borg_pw_id)

export BORG_PASSPHRASE=$( bw get item $PASSWORD_ID | jq -r .login.password )

export SRC_DIR="/mnt/toshiba_ext/working_dir_backup/"

export BORG_REPO="toshiba_backup:/mnt/my_passport/working_dir.borg"
export ENCRYPTION="repokey"

_generic_helper_borg.sh "$1" "$2" "$3"
