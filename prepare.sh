#!/bin/sh

gpg --keyserver pgp.mit.edu --recv-keys 0xA7A21B0A108FF4A9
wget https://www.unrealircd.org/unrealircd4/unrealircd-4.2.1.1.tar.gz.asc
wget https://www.unrealircd.org/unrealircd4/unrealircd-4.2.1.1.tar.gz
gpg --verify unrealircd-4.2.1.1.tar.gz.asc unrealircd-4.2.1.1.tar.gz

mkdir torlib

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
fi

if [ didnotreadreadme ]
then
     echo
     echo
     echo
     echo
fi

