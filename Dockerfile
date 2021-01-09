FROM debian:stable

MAINTAINER OceanIX Administrator <connect@oceanix.net.au>

EXPOSE 179

RUN apt-get update && apt-get install -y \
        autoconf \
    bison \
    build-essential \
    curl \
    flex \
    libreadline-dev \
    libncurses5-dev \
    m4 \
    unzip

WORKDIR /root
RUN curl -O -L ftp://bird.network.cz/pub/bird/bird-1.6.8.tar.gz
RUN tar -xvzf bird-1.6.8.tar.gz

RUN mkdir /etc/bird

RUN cd bird-1.6.8 && \
    autoreconf && \
    ./configure && \
    make && \
    make install

RUN cd bird-1.6.8 && \
    autoreconf && \
    ./configure --enable-ipv6 && \
    make && \
    make install

CMD bird -c /etc/bird/bird.conf -d
