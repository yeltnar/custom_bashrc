export BW_SESSION="$(cat $bashrc_folder/gitignore/BW_SESSION)"
export PASSWORD_ID=$(cat $bashrc_folder/gitignore/borg_pw_id)

export ENCRYPTION="repokey"

if [ -z "$repos_file" ]; then
	echo 'no repo_file env var... exiting';
fi

echo "repos_file is $repos_file";

if [ -z "$@" ]; then
	echo 'no borg arguments! exiting' ;
	exit
fi

content=`cat $repos_file | jq -c .[]`;

cat $repos_file | jq -c .[] | while read -r line; do
	export SRC_DIR=`echo $line | jq -r .SRC_DIR`
	export BORG_NAME=`echo $line | jq -r .BORG_NAME`
	export BORG_REPO=`echo $line | jq -r .BORG_REPO`
	_generic_helper_borg.sh "$1" "$2" "$3"	
done

