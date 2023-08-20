#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

filename=util-linux-2.38.1.tar.xz

extension=.$(echo ${filename} | awk -F'[.]' '{print $(NF-1)"."$NF}')
directory=$(basename ${filename} ${extension})

cd sources \
 && rm -rf ${directory} \
 && tar xf ${filename} \
 && cd ${directory} \
 && ./configure ADJTIME_PATH=/var/lib/hwclock/adjtime \
    --bindir=/usr/bin \
    --libdir=/usr/lib \
    --sbindir=/usr/sbin \
    --docdir=/usr/share/doc/util-linux-2.38.1 \
    --disable-chfn-chsh \
    --disable-login \
    --disable-nologin \
    --disable-su \
    --disable-setpriv \
    --disable-runuser \
    --disable-pylibmount \
    --disable-static \
    --without-python \
 && make \
 && make install \
 && cd .. \
 && rm -rf ${directory} \
 && echo "done ${directory}"