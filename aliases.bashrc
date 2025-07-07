# alias advance_pwd="if [ `/bin/pwd` == `/bin/pwd -P` ]; then /bin/pwd; else /bin/pwd && /bin/pwd -P; fi"
# alias ddd="if [ $(/bin/pwd) == $(/bin/pwd -P) ]; then /bin/pwd; else /bin/pwd && /bin/pwd -P; fi"

#alias vimbashrc="vim ~/.bashrc"
alias vimallbashrc="vim $bashrc_folder/all.bashrc "
alias vimbashrc="vim $bashrc_folder/all.bashrc "
alias vimmacrc="vim $bashrc_folder/mac.bashrc "
alias vimwinrc="vim $bashrc_folder/win.bashrc "
alias vimwinrc="vim $bashrc_folder/win.bashrc "

alias _git_root="git rev-parse --show-toplevel"

alias ..="cd ..;pwd"
# alias --="cd -;pwd"
alias cdmkdir="dir=$1;echo $dir;mkdir $dir; cd $dir"


alias bashhistory="cat ~/.bash_history"
alias lastssh="cat ~/.bash_history | grep "^ssh"| tail -n 1 > /tmp/drewsshcmd;chmod 777 /tmp/drewsshcmd; /tmp/drewsshcmd;rm /tmp/drewsshcmd"


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


alias tmux_help="firefox https://www.hamvocke.com/blog/a-quick-and-easy-guide-to-tmux/"
alias vim_help="firefox https://vim.rtorr.com/"

if [ "$(type nvim 2>&1 | awk '/ not /{print}' | wc -l)" -eq 0 ]
then
	export EDITOR=nvim
	export VISUAL=nvim
	alias vim=nvim
fi

alias les="vim -R";

