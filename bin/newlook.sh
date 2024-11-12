#!/bin/sh

while true
do
        paht=$(find $HOME/Pictures/ -type f -name "*.jpg" -o -name "*.png" -o -name "*.avif" | shuf -n 1)
        paht="file://$paht"

        #echo $paht
        # file:///usr/share/backgrounds/Dynamic_Wallpapers/Catalina.xml
        gsettings set org.gnome.desktop.background picture-uri $paht
        gsettings set org.gnome.desktop.background picture-uri-dark $paht
        sleep 15
done
