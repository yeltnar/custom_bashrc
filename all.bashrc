folder="~/gist"
if [[ `uname` == 'Darwin' ]]; then
	if [ -f ~/gist/mac.bashrc ]; then . ~/gist/mac.bashrc; fi
else
	if [ -f ~/gist/win.bashrc ]; then . ~/gist/win.bashrc; fi
fi

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

alias sshpi="ssh pi@raspberrypi"

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

alias dhistory="history | awk '{\$1=\"\"; print}'"

alias dnpm="~/gist/dnpm"

echo "Loaded all.bashrc"
