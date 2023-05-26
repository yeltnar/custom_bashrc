#export BW_SESSION="$(cat $bashrc_folder/gitignore/BW_SESSION)";

# get password id to query bitwarden
export PASSWORD_ID=$(cat $bashrc_folder/gitignore/borg_pw_id);

export SRC_DIR="/mnt/toshiba_ext/hold_on_to/";

export BORG_NAME="ext hold_on_to offsite";

export BORG_REPO="toshiba_backup_offsite:/home/pi/borg_first"
export ENCRYPTION="repokey"

_generic_helper_borg.sh "$1" "$2" "$3"
