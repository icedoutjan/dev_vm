#!/bin/bash

FONT="MesloLGS NF"
ICON_THEME=" "
CURSOR_THEME=" "
GTK_THEME="Sweet-Ambar-Blue-Dark-v40"
WALLPAPPER=" "

# download the themes or i add a copy to the repo

#install the themes
mkdir -p $HOME/.themes $HOME/.icons
#cp -r .. ..

# set the theme
gsettings set org.gnome.desktop.interface gtk-theme $GTK_THEME
gsettings set org.gnome.desktop.interface icon-theme $ICON_THEME
gsettings set org.gnome.shell.extensions.user-theme name $GTK_THEME
gsettings set org.gnome.desktop.interface cursor-theme $CURSOR_THEME

#install some extensions
gnome-extensions install dash-to-dock 

# set keybinds
# creat keybind paht 
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

# set shortcut for my terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/alacritty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>plus'
