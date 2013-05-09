# running default script
if [ -d /etc/X11/xinit/xinitrc.d ]; then
    for f in /etc/X11/xinit/xinitrc.d/*; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# opening terminals
xrdb -merge .Xresources
xterm -geometry 80x30+0+0 &
xterm -geometry 80x43+0+446 &
xterm -geometry 158x74+647+0 &

# start the windows manager
exec startlxde
