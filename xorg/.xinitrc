xrandr --verbose --output eDP-1-1 --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-0 --primary --mode 2560x1080 -r 75 --pos 1920x0 --rotate normal
/usr/bin/prime-offload &
syndaemon -i 0.5 -t -K -R -d &
xset s off &
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh) &
export SSH_AUTH_SOCK &
source /etc/X11/xinit/xinitrc.d/50-systemd-user.sh &
[[ -f ~/.Xmodmap ]] && xmodmap ~/.Xmodmap &
/home/toasterbirb/Scripts/system/startup.sh &
setxkbmap -layout fi
openrgb -p Default.orp &
exec dwm
