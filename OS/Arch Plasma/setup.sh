sudo pacman --noconfirm -S xorg xorg-xinit plasma firefox vim htop dolphin fish
touch .xinitrc
cat > .xinitrc << EOF
#!/bin/sh

userresources=$HOME/Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap
if [ -f $sysresources ]; then



    xrdb -merge $sysresources

fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi
if [-f "$userresources" ]; then


    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unsetf
fi

exec startplasma-x11
EOF

chsh -s /bin/fish