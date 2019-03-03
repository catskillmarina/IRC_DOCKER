SETUP DIRECTIONS
----------------

READ README.md


install docker
install docker-compose

copy SAMPLE/unrealircd.conf.SAMPLE or SAMPLE/unrealircd.conf.SUGGESTED 
                          to ./unrealircd.conf -- YOU MUST EDIT THIS FILE !!
                                                  --------------------------
Don't move the SAMPLE files, copy them. The prepare script does some 
reasonability checking.


you may want to edit ircd.motd and or 
                     ircd.rules for your particular application.

copy SAMPLE/torrc.SAMPLE or SAMPLE/torrc.SUGGESTED to ./torrc -- 
                                                 YOU MUST EDIT THIS FILE !!
                                                 --------------------------

IMPORTANT
---------
If you are running more than one of these images on the same Docker setup
you will need to edit docker-compose.yml to change tor-ircd to a unique value !
                 -----------------------           --------

Run prepare.sh in THIS directory - that fetches things for you.

ONLY PROCEED if YOU GET A GOOD SIGNATURE and NO ERRORS !
ONLY PROCEED if YOU GET A GOOD SIGNATURE and NO ERRORS !
ONLY PROCEED if YOU GET A GOOD SIGNATURE and NO ERRORS !
ONLY PROCEED if YOU GET A GOOD SIGNATURE and NO ERRORS !

# Run the following commands
----------------------------
docker-compose build

# if the build is ok
--------------------
docker-compose up -d 

Getting Hostname and Auth Cookies
---------------------------------
Look in torlib to find the keys and hostname for your
irc hidden service details. If you used HiddenServiceAuthorizeClient
the access cookies and onion addresses will be in that directory 
too. Look in the hidden service directory.

Clients
-------
On CLIENTS, NOT this server you will need to add the following
directives if you used HiddenServiceAuthorizeClient.

HidServAuth whatever.onion <whatever the cookie is> unneccesary-argument

With an android client you can set up auth with the gui.
