#!/bin/bash

chown -R ircd:ircd /home/ircd/unrealircd
chown -R debian-tor:debian-tor /var/lib/tor
chown -R debian-tor:debian-tor /var/lib/tor/*

exec "$@"
