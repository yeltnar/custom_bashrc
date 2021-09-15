bashrc_folder="$HOME/playin/custom_bashrc"
export custom_bashrc_folder=$bashrc_folder;

# check if tmux is found, and not currently tmux
if [ ! -z "$(which tmux)" ] && [ -z "$TMUX" ] && [ -z "$NO_TMUX" ]; then
	tmux && exit
fi

if [[ `uname` == 'Darwin' ]]; then
	if [ -f $bashrc_folder/mac.bashrc ]; then . $bashrc_folder/mac.bashrc; fi
else
	if [ -f $bashrc_folder/linux.bashrc ]; then . $bashrc_folder/linux.bashrc; fi
fi

alias advance_pwd="if [ `/bin/pwd` == `/bin/pwd -P` ]; then /bin/pwd; else /bin/pwd && /bin/pwd -P; fi"
alias ddd="if [ $(/bin/pwd) == $(/bin/pwd -P) ]; then /bin/pwd; else /bin/pwd && /bin/pwd -P; fi"

alias clear_pwd_ls="clear;pwd;ls"
alias cpl="clear_pwd_ls" 
# alias cls="clear_pwd_ls"

# alias claer="clear"
# alias clera="clear"

#alias vimbashrc="vim ~/.bashrc"
alias vimmacrc="vim $bashrc_folder/mac.bashrc "
alias vimbashrc="vim $bashrc_folder/all.bashrc "
alias vimwinrc="vim $bashrc_folder/win.bashrc "
alias vimwinrc="vim $bashrc_folder/win.bashrc "

alias ..="cd ..;pwd"
# alias --="cd -;pwd"
alias cdmkdir="dir=$1;echo $dir;mkdir $dir; cd $dir"
alias bashhistory="cat ~/.bash_history"
alias lastssh="cat ~/.bash_history | grep "^ssh"| tail -n 1 > /tmp/drewsshcmd;chmod 777 /tmp/drewsshcmd; /tmp/drewsshcmd;rm /tmp/drewsshcmd"

# add timestamp to all history commands.  hs function is set to hide this info unless asked for
export HISTTIMEFORMAT="(%c) "

alias fudge=fuck

firebase_person_id(){
	cat $bashrc_folder/gitignore/firebase_person_id
}

firebase_token(){
	cat $bashrc_folder/gitignore/firebase_token
}

piip(){
	pi_ip=$(curl "https://node.andbrant.com/database?person_id=$(firebase_person_id)&token=$(firebase_token)&data_location=devices.exposed_pi.public_ip_v4"| awk '{print substr($0, 2, length($0) - 2)}')
	echo $pi_ip
}

send_push(){

	person_id=$(cat $bashrc_folder/gitignore/firebase_person_id)
	token=$(cat $bashrc_folder/gitignore/firebase_token)

	title=$1
	text=$2

	title=$(node -e "process.stdout.write(encodeURIComponent('$title'))")
	text=$(node -e "process.stdout.write(encodeURIComponent('$text'))")

	curl --location --request POST "node.andbrant.com/join/api?person_id=$person_id&token=$token&deviceId=group.android&title=$title&text=$text" --header 'Content-Type: application/json'

	echo "";
	echo "sent - title: $title text: $text";
}

# alias sshpi="ssh pi@raspberrypi"
sshpi(){
	ssh_command="-p 23 pi@$(piip)"
	echo $ssh_command
	ssh $ssh_command
}

# alias sshpi="ssh pi@raspberrypi"
sftppi(){
	sftp_command="-P 23 pi@$(piip)"
	echo $sftp_command
	sftp $sftp_command
}

alias ubsh="olddir=$(pwd); cd $bashrc_folder; git pull; cd $olddir"
alias pushall="git add .; git commit -m $1; git push"

alias pullandroidsettings="adb shell settings list system > system.txt; adb shell settings list global > global.txt; adb shell settings list secure > secure.txt"
alias express_init="git clone https://github.com/yeltnar/express_starter.git ."

alias dockerr="docker exec -it c219012c4777 /bin/bash"
alias dockerexec=$bashrc_folder/dockerexec.sh

alias cr="clear && history | cut -c 8- | tail -n 2 | head -n 1 | bash"

#alias control_phone="adb_dock && scrcpy --max-size 1706 || true && adb_undock &"
alias control_phone="adb_dock && scrcpy --max-size 1024 || true && adb_undock &"
alias ssh_phone="adb shell am broadcast --user 0 -a net.dinglish.tasker.termux.ssh && adb forward tcp:8022 tcp:8022 && ssh localhost -p 8022"
alias adb_dock="adb shell am broadcast --user 0 -a net.dinglish.tasker.dock"
alias adb_undock="adb shell am broadcast --user 0 -a net.dinglish.tasker.undock"

alias create-react-app="npx create-react-app"

alias dhistory="history | awk '{\$1=\"\"; print}'"

alias dnpm="$bashrc_folder/dnpm"

alias toupper="node $bashrc_folder/uppercase.js"
alias tolower="node $bashrc_folder/lowercase.js"

npmscripts(){
	cat "package.json" | jq .scripts
}

firefox_new(){
	num=1;
	dir="/tmp/ff_profile_$num/";
	rm -rf $dir;
	mkdir $dir;
	echo "firefox --profile $dir" | bash;
	rm -rf $dir
	echo "removed ff_profile"
}

push_when_build_done(){
	clear

	oc status &> /dev/null; # redirect stdout and stderr to null file
	
	if [ $? -gt 0 ] # check the exit code of the last line
	then
		printf "Exiting... Need to login to oc\n"
		return;
	fi

	tmp=$(oc get --all-namespaces pods | grep Running | grep build | wc -l | awk '/.*/{print $1}')
	while [ $tmp -gt 0 ]; 
	do 
		tmp=$(oc get --all-namespaces pods | grep Running | grep build | wc -l | awk '/.*/{print $1}')
		printf "$tmp is more than 0 $(date)\n"; 
		sleep 30; 
	done
	printf "tmp...\n$tmp"
	printf 'exiting\n'
	send_push 'build' 'is completed'
}

git_merge_in_main(){
	main_branch=$(git remote show origin | awk '/HEAD/{print $3}')
	working_branch=$(git branch | awk '/^\*/{print $2}')
	git checkout $main_branch &&
	git pull &&
	git checkout $working_branch &&
	git merge $main_branch
}
git_delete_current_branch(){
	working_branch=$(git branch | awk '/^\*/{print $2}')
	git checkout dev &&
	git branch -D $working_branch
}

dhelp(){

	help_files_dir=drewhelp

	if [ -z ${1} ]; 
	then
		ls $bashrc_folder/$help_files_dir;
	else
		cat $bashrc_folder/$help_files_dir/$1;
	fi
}

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
	if [ -f $1 ] ; then
	case $1 in
		*.tar.bz2)   tar vxjf $1     ;;
		*.tar.gz)    tar vxzf $1     ;;
		*.bz2)       bunzip2 $1     ;;
		*.rar)       unrar e $1     ;;
		*.gz)        gunzip $1      ;;
		*.tar)       tar vxf $1      ;;
		*.tbz2)      tar vxjf $1     ;;
		*.tgz)       tar vxzf $1     ;;
		*.zip)       unzip $1       ;;
		*.Z)         uncompress $1  ;;
		*.7z)        7z x $1        ;;
		*)     echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

savelastcommand(){
	history | tail -n 2 | head -n 1 >> /tmp/history_save
}

cdbashrc(){
	cd $bashrc_folder 
}

nebula_name="drew-lin-lap";
nebula_folder="$HOME/nebula/$nebula_name/";
sudo_start_nebula(){
	cd "$nebula_folder";
	sudo ../nebula -config config.yml
}

# set vim as default editor 
export VISUAL=vim
export EDITOR="$VISUAL"

alias tmux_help="firefox https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/"
alias vim_help="firefox https://vim.rtorr.com/"

set bell-style visible

echo "Loaded all.bashrc"


