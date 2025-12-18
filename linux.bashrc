drewbin

copy(){
    xclip -selection clipboard
}

paste(){
    xclip -selection clipboard -o
}

battery(){
        upower -i /org/freedesktop/UPower/devices/battery_BAT0
}

batterylevel(){
        battery | awk '/percentage/{print $2}'

}

restartGnome(){
	killall -3 gnome-shell
}

