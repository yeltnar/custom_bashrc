# Commands that should be applied only for interactive shells.
[[ $- == *i* ]] || return

if tty -s
then
  . $bashrc_folder/setup_device.sh
  . $bashrc_folder/all.bashrc
fi

