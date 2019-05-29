FROM ubuntu:16.04

RUN apt-get update

RUN apt-get install -y build-essential

RUN apt-get install -y autoconf

RUN apt-get install -y g++-arm-linux-gnueabihf g++-4.8-arm-linux-gnueabihf g++-5-arm-linux-gnueabihf \
                           gcc-arm-linux-gnueabihf gcc-4.8-arm-linux-gnueabihf gcc-5-arm-linux-gnueabihf \
                           binutils-arm-linux-gnueabihf libc6-dev-armhf-cross

RUN apt-get install -y pkg-config

COPY smcroute /srv/smcroute

WORKDIR /srv/smcroute

COPY _build.sh /srv/_build.sh

CMD tail -f /dev/null
