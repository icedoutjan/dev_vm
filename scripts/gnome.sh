#!/bin/bash

FONT="MesloLGS NF"
ICON_THEME=" "
CURSOR_THEME=" "
GTK_THEME="Sweet-Ambar-Blue-Dark-v40"
WALLPAPER="file:///usr/share/backgrounds/Dynamic_Wallpapers/Catalina.xml"

# download the themes or i add a copy to the repo

#install the themes
mkdir -p $HOME/.themes $HOME/.icons
#cp -r .. ..

# set the theme
gsettings set org.gnome.desktop.interface gtk-theme $GTK_THEME
gsettings set org.gnome.desktop.interface icon-theme $ICON_THEME
gsettings set org.gnome.shell.extensions.user-theme name $GTK_THEME
gsettings set org.gnome.desktop.interface cursor-theme $CURSOR_THEME

# install wallpaper
install_wallpaper () {
        mkdir -p /usr/share/backgrounds/Dynamic_Wallpapers
        mkdir -p /usr/share/gnome-background-properties/

        cp -r ../wallpaper/Catalina /usr/share/backgrounds/Dynamic_Wallpapers/
        cp ../wallpaper/Catalina.xml /usr/share/backgrounds/Dynamic_Wallpapers/
        cp ../wallpaper/CatalinaMain.xml /usr/share/gnome-background-properties/Catalina.xml
}

sudo install_wallpaper

# set background 
gsettings set org.gnome.desktop.background picture-uri $WALLPAPER
gsettings set org.gnome.desktop.background picture-uri-dark $WALLPAPER

#install some extensions
gnome-extensions install dash-to-dock 

# set keybinds
# creat keybind paht 
gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"

# set shortcut for my terminal
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name 'Terminal'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command '/usr/bin/alacritty'
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding '<Super>plus'

