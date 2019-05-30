#!/usr/bin/env bash

cd /srv/smcroute

./autogen.sh

CC=/usr/bin/arm-linux-gnueabihf-gcc ./configure --host=arm --prefix=/

CC=/usr/bin/arm-linux-gnueabihf-gcc make

CC=/usr/bin/arm-linux-gnueabihf-gcc make install
