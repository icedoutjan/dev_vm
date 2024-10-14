#!/bin/sh

# is maybe not the best way but i start here to write down wich packes i like
if [ $whoami == "root" ];then
        pacman -S --noconfirm --quiet cmake grc fastfetch pacman-contrib btop vim alacritty yazi tldr
else
        echo "run as root"
fi
