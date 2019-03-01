FROM debian:sid

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y apt-utils \
                       build-essential \
                       git \
                       wget \
                       libssl-dev \
                       tor \
                       make \
                       gcc \
                       openssl \
                       libcurl4-openssl-dev \
                       zlib1g \
                       zlib1g-dev \
                       zlibc \
                       libgcrypt20-dev \
                       supervisor && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN useradd -m ircd 
COPY unrealircd-4.2.1.1.tar.gz /home/ircd/
RUN cd /home/ircd/ && \
    tar xzvf unrealircd-4.2.1.1.tar.gz && \
    mkdir /home/ircd/unrealircd/ && \
    chown -R ircd:ircd /home/ircd/ 

COPY config.settings /home/ircd/unrealircd-4.2.1.1

RUN cd /home/ircd/unrealircd-4.2.1.1 && \
    ./Config && \
    make && \
    make install && \
    rm -rf /home/ircd/unrealircd-4.2.1.1

COPY supervisord.conf /etc/supervisord.conf
COPY unrealircd.conf /home/ircd/unrealircd/conf/unrealircd.conf
COPY ircd.motd /home/ircd/unrealircd/conf/ircd.motd
COPY ircd.rules /home/ircd/unrealircd/conf/ircd.rules
COPY unrealircd-entrypoint.sh /entrypoint.sh
COPY torrc /etc/tor/torrc

RUN chmod +x entrypoint.sh && \
    chown -R debian-tor:debian-tor /var/lib/tor && \
    chmod -R 777 /var/lib/tor

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/usr/bin/supervisord -c /etc/supervisord.conf"]

EXPOSE 6697
EXPOSE 6667
EXPOSE 7000

