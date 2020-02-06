folder="~/gist"
if [[ `uname` == 'Darwin' ]]; then
	if [ -f ~/gist/mac.bashrc ]; then . ~/gist/mac.bashrc; fi
else
	if [ -f ~/gist/win.bashrc ]; then . ~/gist/win.bashrc; fi
fi

alias advance_pwd="if [ `/bin/pwd` == `/bin/pwd -P` ]; then /bin/pwd; else /bin/pwd && /bin/pwd -P; fi"
alias ddd="if [ $(/bin/pwd) == $(/bin/pwd -P) ]; then /bin/pwd; else /bin/pwd && /bin/pwd -P; fi"

alias clear_pwd_ls="clear;pwd;ls"
alias cpl="clear_pwd_ls" 
# alias cls="clear_pwd_ls"

# alias claer="clear"
# alias clera="clear"

alias sns="clear; sudo npm start"
alias gist="cd ~/gist"
alias bashrc="vim ~/.bashrc"
alias macrc="vim $folder/mac.bashrc "
alias allrc="vim $folder/all.bashrc "
alias winrc="vim $folder/win.bashrc "
alias ..="cd ..;pwd"
alias cdmkdir="dir=$1;echo $dir;mkdir $dir; cd $dir"
alias bashhistory="cat ~/.bash_history"
alias lastssh="cat ~/.bash_history | grep "^ssh"| tail -n 1 > /tmp/drewsshcmd;chmod 777 /tmp/drewsshcmd; /tmp/drewsshcmd;rm /tmp/drewsshcmd"

alias fudge=fuck

firebase_person_id(){
	cat ~/gist/gitignore/firebase_person_id
}

firebase_token(){
	cat ~/gist/gitignore/firebase_token
}

piip(){
	pi_ip=$(curl "https://node.andbrant.com/database?person_id=$(firebase_person_id)&token=$(firebase_token)&data_location=devices.exposed_pi.public_ip_v4"| awk '{print substr($0, 2, length($0) - 2)}')
	echo $pi_ip
}

send_push(){
	url="https://node.andbrant.com/join/api?person_id=$(firebase_person_id)&token=$(firebase_token)&deviceId=group.android&title=title goes here&text=text goes here"
	res=$(curl "$url")

	curl --location --request POST "$url"

	echo "$url"
	echo $res
}

# alias sshpi="ssh pi@raspberrypi"
sshpi(){
	ssh_command="-p 23 pi@$(piip)"
	echo $ssh_command
	ssh $ssh_command
}

alias ubsh="olddir=$(pwd); cd $folder; git pull; cd $olddir"
alias pushall="git add .; git commit -m $1; git push"

alias pullandroidsettings="adb shell settings list system > system.txt; adb shell settings list global > global.txt; adb shell settings list secure > secure.txt"
alias express_init="git clone https://github.com/yeltnar/express_starter.git ."

alias dockerr="docker exec -it c219012c4777 /bin/bash"
alias dockerexec=~/gist/dockerexec.sh

alias cr="clear && history | cut -c 8- | tail -n 2 | head -n 1 | bash"

#alias control_phone="adb_dock && scrcpy --max-size 1706 || true && adb_undock &"
alias control_phone="adb_dock && scrcpy --max-size 1024 || true && adb_undock &"
alias ssh_phone="adb shell am broadcast --user 0 -a net.dinglish.tasker.termux.ssh && adb forward tcp:8022 tcp:8022 && ssh localhost -p 8022"
alias adb_dock="adb shell am broadcast --user 0 -a net.dinglish.tasker.dock"
alias adb_undock="adb shell am broadcast --user 0 -a net.dinglish.tasker.undock"

alias create-react-app="npx create-react-app"

alias dhistory="history | awk '{\$1=\"\"; print}'"

alias dnpm="~/gist/dnpm"

alias toupper="node ~/gist/uppercase.js"
alias tolower="node ~/gist/lowercase.js"

firefox_new(){
	num=1;
	dir="/tmp/ff_profile_$num/";
	rm -rf $dir;
	mkdir $dir;
	echo "firefox --profile $dir" | bash;
	rm -rf $dir
	echo "removed ff_profile"
}

echo "Loaded all.bashrc"
