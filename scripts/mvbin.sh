#!/bin/sh

BINPATH=$HOME/.local/bin/

#init the local bin dir
mkdir -p $BINPATH
#copy the executabils 
gcc ../bin/battery.cpp -O3 -o $BINPATH/battery 

#make sure for the right permissions
chmod +x $BINPATH/*
