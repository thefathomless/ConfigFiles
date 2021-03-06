cd ~
sudo pacman --noconfirm -S xorg xorg-xinit plasma firefox vim htop dolphin xterm konsole fish neofetch git
curl https://raw.githubusercontent.com/thefathomless/ConfigFiles/main/Apps/Vim/.vimrc.txt > .vimrc
touch .xinitrc
cat > .xinitrc << EOF
#!/bin/sh

userresources=\$HOME/.Xresources
usermodmap=\$HOME/.Xmodmap
sysresources=/usr/X11R6/lib/X11/xinit/.Xresources
sysmodmap=/usr/X11R6/lib/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f \$sysresources ]; then
    xrdb -merge \$sysresources
fi

if [ -f \$sysmodmap ]; then
    xmodmap \$sysmodmap
fi

if [ -f \$userresources ]; then
    xrdb -merge \$userresources
fi

if [ -f \$usermodmap ]; then
    xmodmap \$usermodmap
fi

exec startplasma-x11
EOF



chsh -s /bin/fish
echo ""
echo "To enter the GUI type 'startx' to finish changing the shell you should restart your computer"
