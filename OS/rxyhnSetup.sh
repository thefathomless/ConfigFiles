sudo pacman -S xorg xorg-xinit alacritty vim firefox git base-devel

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

exec awesome
EOF

git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -sri

paru -S awesome-git picom-git wezterm rofi acpi acpid acpi_call upower lxappearance-gtk3 jq inotify-tools polkit-gnome xdotool xclip gpick ffmpeg blueman redshift pamixer brightnessctl feh scrot mpv mpd mpc mpdris2 python-mutagen ncmpcpp playerctl --needed

systemctl --user enable mpd.service
systemctl --user start mpd.service

git clone https://github.com/rxyhn/dotfiles.git

mkdir .config 
mkdir .fonts
mkdir .local
cd .local 
mkdir share
cd share
mkdir fonts
cd ~/dotfiles

cp -r config/* ~/.config/
cp -r misc/fonts/* ~/.fonts/
cp -r misc/fonts/* ~/.local/share/fonts/

fc-cache -vim

cd ~

cd .config/awesome

git clone https://github.com/BlingCorp/bling.git
git clone https://github.com/andOrlando/color.git
git clone https://github.com/xinhaoyuan/layout-machi.git
git clone https://github.com/Aire-One/awesome-battery_widget


