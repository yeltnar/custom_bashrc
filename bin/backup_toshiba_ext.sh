export BW_SESSION="$(cat $bashrc_folder/gitignore/BW_SESSION)";
export PASSWORD_ID=$(cat $bashrc_folder/gitignore/borg_pw_id);

export SRC_DIR="/mnt/toshiba_ext/hold_on_to/";

export BORG_NAME="ext hold_on_to";

export BORG_REPO="toshiba_backup:/mnt/my_passport/toshiba_ext.borg"
export ENCRYPTION="repokey"

_generic_helper_borg.sh "$1" "$2" "$3"
