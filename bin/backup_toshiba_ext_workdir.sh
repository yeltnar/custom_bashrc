export BW_SESSION="$(cat $bashrc_folder/gitignore/BW_SESSION)"
export PASSWORD_ID=$(cat $bashrc_folder/gitignore/borg_pw_id)

export SRC_DIR="/mnt/toshiba_ext/working_dir_backup/"

export BORG_NAME="ext workdir";

# toshiba_backup is an entry in ~/.ssh/config
export BORG_REPO="toshiba_backup:/mnt/2t_toshiba/working_dir.borg"
export ENCRYPTION="repokey"

_generic_helper_borg.sh "$1" "$2" "$3"
