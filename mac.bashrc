printf "Hello Drew. Welcome to your Mac. "
alias stagec="ssh root@172.27.70.41"
alias corpus="cd /Users/Drew/Documents/GISC\ Project/cigsdev_corpus_v1/; sudo npm start;"
alias mvp="cd /Users/Drew/Documents/GISC\ Project/cigsdev_mvp_v1/; sudo npm start;" 

alias ghostty_gui="open /Applications/Ghostty.app/"
alias brave="/Applications/Brave\ Browser.app/Contents/MacOS/Brave\ Browser"
alias lapce="/Applications/Lapce.app/Contents/MacOS/lapce"
alias gimp="/Applications/GIMP.app/Contents/MacOS/GIMP"
alias vlc="/Applications/VLC.app/Contents/MacOS/VLC"

alias cf="ibmcloud cf $@"

alias playbacks="vim ~/filedumps/playbacks"
alias todo="vim ~/filedumps/todo"
alias hours="vim ~/filedumps/hours"

alias chrome-nix-tmp="nix develop ~/playin/nixos_files/shells/chrome"

to_move="$HOME/client_engineering/"
cdclient_engineering(){
  if [ "" != "$1" ]; then
    to_move="$to_move/$1";
  fi
  pushd $to_move;
}

_script_cdclient_engineering() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local start_dir="$to_move/"
  # don't put space at end of completion 
  compopt -o nospace 
  COMPREPLY=( $( cd "$start_dir"; compgen -d -S / -- "$cur" ) )
}
complete -F _script_cdclient_engineering cdclient_engineering

