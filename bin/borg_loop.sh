export repos_file="$bashrc_folder/gitignore/borg_repos.json"

if [ -z "$@" ]; then
	echo 'no borg arguments! exiting' ;
	exit
fi

echo ">$1 $2 $3<"

_generic_borg_loop.sh "$1"

