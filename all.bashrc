export bashrc_folder="$HOME/playin/custom_bashrc"

PATH="$PATH:$bashrc_folder/bin"
PATH="$PATH:$bashrc_folder/bin/homeassistant"

# check if tmux is found, and not currently tmux
if [ ! -z "$(which tmux)" ] && [ -z "$TMUX" ] && [ -z "$NO_TMUX" ]; then
	
	tmux_random_id="$(date "+%s-%N")";
	new_id=$tmux_random_id

	tmux new-session -d -t "$tmux_random_id" &&
	tmux send-keys -t "$tmux_random_id" "export tmux_random_id=$tmux_random_id" C-m &&
	tmux rename-ses -t "$tmux_random_id" "$new_id" &&
	tmux attach-ses -t "$new_id" && 
	exit;
fi

if [[ `uname` == 'Darwin' ]]; then
	if [ -f $bashrc_folder/mac.bashrc ]; then . $bashrc_folder/mac.bashrc; fi
else
	if [ -f $bashrc_folder/linux.bashrc ]; then . $bashrc_folder/linux.bashrc; fi
fi

if [ "$SHLVL" -eq 2 ] && [ -n "$TMUX" ]; then
	session_info;
elif [ "$SHLVL" -eq 1 ]; then
	session_info;
fi

alias advance_pwd="if [ `/bin/pwd` == `/bin/pwd -P` ]; then /bin/pwd; else /bin/pwd && /bin/pwd -P; fi"
alias ddd="if [ $(/bin/pwd) == $(/bin/pwd -P) ]; then /bin/pwd; else /bin/pwd && /bin/pwd -P; fi"

#alias vimbashrc="vim ~/.bashrc"
alias vimallbashrc="vim $bashrc_folder/all.bashrc "
alias vimbashrc="vim $bashrc_folder/all.bashrc "
alias vimmacrc="vim $bashrc_folder/mac.bashrc "
alias vimwinrc="vim $bashrc_folder/win.bashrc "
alias vimwinrc="vim $bashrc_folder/win.bashrc "

alias ..="cd ..;pwd"
# alias --="cd -;pwd"
alias cdmkdir="dir=$1;echo $dir;mkdir $dir; cd $dir"

cdbashrc(){
	cd $bashrc_folder
	if [ "" != "$1" ]; then
		cd "$1";
	fi
}

cdsystemctl(){
	cd /etc/systemd/system 	 
}

alias bashhistory="cat ~/.bash_history"
alias lastssh="cat ~/.bash_history | grep "^ssh"| tail -n 1 > /tmp/drewsshcmd;chmod 777 /tmp/drewsshcmd; /tmp/drewsshcmd;rm /tmp/drewsshcmd"

# add timestamp to all history commands.  hs function is set to hide this info unless asked for
export HISTTIMEFORMAT="(%c) "

alias fudge=fuck

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

savelastcommand(){
	history | tail -n 2 | head -n 1 >> /tmp/history_save
}

codebashrc(){
	code  $bashrc_folder/all.bashrc;
}

dshutdown(){
	printf "This will shutdown after the specified number of seconds, printing each second.\n";
	print_countdown $1;
	[ -z "$1" ] ||shutdown now;
}

print_countdown(){
    if [ -z "$1" ] 
    then
        echo 'no shutdown_time provided ';
    else
		countdown_time="$1"; 
		printf "change this from node to bash\n";
		node -e "let c=$countdown_time;\
		let f=()=>{\
			console.log(c);\
			if(c===0){\
				clearInterval(id);\
			}\
			c--;\
		};\
		f();\
		let id=setInterval(f,1000);";
    fi


}

nebula_name=$DEVICE_NAME;
nebula_folder="$HOME/nebula/$nebula_name/";
sudo_start_nebula(){
	cd "$nebula_folder";
	sudo ../nebula -config config.yml
}

# set vim as default editor 
export VISUAL=vim
export EDITOR="$VISUAL"

alias kc=kubectl;

alias tmux_help="firefox https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/"
alias vim_help="firefox https://vim.rtorr.com/"

set bell-style visible

if [ "$(type nvim 2>&1 | awk '/ not /{print}' | wc -l)" -eq 0 ]
then
	export EDITOR=nvim
	export VISUAL=nvim
	alias vim=nvim
fi

XDG_CONFIG_HOME="$bashrc_folder/alacritty/alacritty.yml"

#set -o vi

# Set history to ignore consecutive duplicate commands and commands that start with a space
export HISTCONTROL="ignorespace:erasedups"
_clean_history() {
  # history -n has to be there before history -w to read from
  # .bash_history the commands saved from any other terminal,
  history -n            # Read in entries that are not in current history
  history -w            # Write history, trigger erasedups
  #history -a            # Append history; does not trigger erasedups
  history -c            # Clear current history
  history -r            # Read history from $HISTFILE
}
# PROMPT_COMMAND="_clean_history; $PROMPT_COMMAND" # this will sync history across tmux



# change this to modify the user info
# PS1="\h:\W \u\$"
PS_YELLOW="\[\033[01;93m\]"
PS_LIGHT_BLUE="\[\033[01;96m\]"
PS_WHITE="\[\033[97m\]"
PS_COLOR_RESET="\[\033[00m\]"
PS_USER="\u"
PS_HOSTNAME="\h"
PS_PWD="\w"
PS1_GIT=""
PS1="${PS_YELLOW}${PS_USER}@${PS_HOSTNAME}${PS_COLOR_RESET}:\
${PS_LIGHT_BLUE}${PS_PWD}${PS_COLOR_RESET} \
${PS_WHITE}\${PS1_GIT}${PS_COLOR_RESET}\n\
${PS_LIGHT_BLUE}∟> \$${PS_COLOR_RESET} "
PS2="${PS_LIGHT_BLUE} > ${PS_COLOR_RESET}  "

for f in $(ls $bashrc_folder/autocomplete); do
  #echo "sourcing " "$bashrc_folder/autocomplete/$f"
  . "$bashrc_folder/autocomplete/$f"
done

prompt_command() {
  # $? is 0 if git dir, otherwise false

  if git status > /dev/null 2>&1; then
    local GIT_STATUS=$(git status | grep 'On branch' | cut -b 11-)
    export PS1_GIT="${GIT_STATUS}"
  else
    export PS1_GIT=""	
  fi
}
PROMPT_COMMAND="prompt_command ; $PROMPT_COMMAND"

echo "Loaded all.bashrc"

if [ -n "$(which nvim)" ] && [ ! -e ~/.config/nvim/init.vim ]; then
	echo "neovim is installed but ~/.config/nvim/init.vim isn't found. Copy the default?";
	read -p "Copy nvim config? (y/n) " cp_nvim;
	if [ "$cp_nvim" == "y" ]; then
		echo "Copying the init.vim file"
		mkdir -p ~/.config/nvim/;
		cp "$bashrc_folder/init.vim" ~/.config/nvim/init.vim;
	fi
fi

#shutdown "+60"
