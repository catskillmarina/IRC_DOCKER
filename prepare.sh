#!/bin/sh


didnotreadreadme=0

if [ ! -f torrc ]
then
    echo
    echo "Read Readme.md then try again !!!!"
    echo "----------------------------------"
    echo "torrc is missing !!!!"
    didnotreadreadme=1
fi
if [ ! -f unrealircd.conf ]
then
    echo
    echo "Read Readme.md then try again !!!!"
    echo "----------------------------------"
    echo "unrealircd.conf is missing !!!!"
    didnotreadreadme=1
else
    echo "I will be checking if this file has been edited here"
fi


if [ didnotreadreadme ]
then
     echo
     echo
     echo
     echo
else
     gpg --keyserver pgp.mit.edu --recv-keys 0xA7A21B0A108FF4A9
     # Check if getting key worked #

     wget https://www.unrealircd.org/unrealircd4/unrealircd-4.2.1.1.tar.gz.asc
     wget https://www.unrealircd.org/unrealircd4/unrealircd-4.2.1.1.tar.gz
     # Check if files are present #

     gpg --verify unrealircd-4.2.1.1.tar.gz.asc unrealircd-4.2.1.1.tar.gz
     # Check if files verified #

     # if checks were successful
     mkdir torlib
     mkdir varlog
fi

