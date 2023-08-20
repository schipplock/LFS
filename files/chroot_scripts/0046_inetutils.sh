#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf inetutils-2.3 \
 && tar xf inetutils-2.3.tar.xz \
 && cd inetutils-2.3 \
 && ./configure --prefix=/usr \
    --bindir=/usr/bin \
    --localstatedir=/var \
    --disable-logger \
    --disable-whois \
    --disable-rcp \
    --disable-rexec \
    --disable-rlogin \
    --disable-rsh \
    --disable-servers \
 && make \
 && make install \
 && mv -v /usr/{,s}bin/ifconfig \
 && cd .. \
 && rm -rf inetutils-2.3 \
 && echo "done inetutils"