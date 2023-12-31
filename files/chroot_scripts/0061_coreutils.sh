#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf coreutils-9.1 \
 && tar xf coreutils-9.1.tar.xz \
 && cd coreutils-9.1 \
 && patch -Np1 -i ../coreutils-9.1-i18n-1.patch \
 && autoreconf -fiv \
 && FORCE_UNSAFE_CONFIGURE=1 ./configure \
    --prefix=/usr \
    --enable-no-install-program=kill,uptime \
 && make \
 && make install \
 && mv -v /usr/bin/chroot /usr/sbin \
 && mv -v /usr/share/man/man1/chroot.1 /usr/share/man/man8/chroot.8 \
 && sed -i 's/"1"/"8"/' /usr/share/man/man8/chroot.8 \
 && cd .. \
 && rm -rf coreutils-9.1 \
 && echo "done coreutils"