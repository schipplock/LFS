#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf util-linux-2.38.1 \
 && tar xf util-linux-2.38.1.tar.xz \
 && cd util-linux-2.38.1 \
 && mkdir -pv /var/lib/hwclock \
 && ./configure ADJTIME_PATH=/var/lib/hwclock/adjtime \
    --libdir=/usr/lib \
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
    runstatedir=/run \
 && make \
 && make install \
 && cd .. \
 && rm -rf util-linux-2.38.1 \
 && echo "done util-linux"