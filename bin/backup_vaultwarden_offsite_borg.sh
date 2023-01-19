export BW_SESSION="$(cat $bashrc_folder/gitignore/BW_SESSION)"
export PASSWORD_ID=$(cat $bashrc_folder/gitignore/borg_pw_id)

export BORG_PASSPHRASE=$( bw_autologin get item $PASSWORD_ID | jq -r .login.password )

export SRC_DIR="/mnt/toshiba_ext/working_dir_backup/"
export SRC_DIR="/mnt/toshiba_ext/working_dir_backup/vaultwarden_start/vaultwarden_start"

export BORG_REPO="root@do.andbrant.com:/root/borg_upload/vaultwarden.borg"
export ENCRYPTION="repokey"

_generic_helper_borg.sh "$1" "$2" "$3"
