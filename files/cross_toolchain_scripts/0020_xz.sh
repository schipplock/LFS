#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf xz-5.2.6 \
 && tar xf xz-5.2.6.tar.xz \
 && cd xz-5.2.6 \
 && ./configure --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess) \
    --disable-static \
    --docdir=/usr/share/doc/xz-5.2.6 \
 && make \
 && make DESTDIR=$LFS install \
 && rm -v $LFS/usr/lib/liblzma.la \
 && cd .. \
 && rm -rf xz-5.2.6