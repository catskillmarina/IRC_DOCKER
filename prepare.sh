#!/bin/sh

gpg --keyserver pgp.mit.edu --recv-keys 0xA7A21B0A108FF4A9
wget https://www.unrealircd.org/unrealircd4/unrealircd-4.2.0.tar.gz.asc
gpg --verify unrealircd-4.2.0.tar.gz.asc unrealircd-4.2.0.tar.gz

mkdir torlib
