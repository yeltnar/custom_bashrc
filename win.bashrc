printf "Hello Drew. Welcome to your Desktop. "
#alias chrome="/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe"
alias drew="cd /mnt/c/Users/Drew"
alias cmd="/mnt/c/Windows/System32/cmd.exe"
alias sd="echo Shuting down;sleep 5;curl https://maker.ifttt.com/trigger/desk_power_off/with/key/bXrf4Mm5tIy0Bjis08SiYC;echo /mnt/c/Windows/system32/shutdown.exe"

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

sleephelp(){
        echo 'systemctl suspend'
}

