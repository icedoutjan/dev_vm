#!/bin/bash

FONT="MesloLGS NF"
ICON_THEME=" "
CURSOR_THEME=" "
GTK_THEME=" "
WALLPAPPER=" "

# download the themes

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
