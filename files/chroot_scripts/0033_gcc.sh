#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf gcc-12.2.0 \
 && tar xf gcc-12.2.0.tar.xz \
 && cd gcc-12.2.0 \
 && sed -e '/m64=/s/lib64/lib/' -i.orig gcc/config/i386/t-linux64 \
 && mkdir -v build \
 && cd build \
 && ../configure --prefix=/usr \
    LD=ld \
    --enable-languages=c,c++ \
    --disable-multilib \
    --disable-bootstrap \
    --with-system-zlib \
 && make \
 && make install \
 && ln -svr /usr/bin/cpp /usr/lib \
 && ln -sfv ../../libexec/gcc/$(gcc -dumpmachine)/12.2.0/liblto_plugin.so /usr/lib/bfd-plugins/ \
 && mkdir -pv /usr/share/gdb/auto-load/usr/lib \
 && mv -v /usr/lib/*gdb.py /usr/share/gdb/auto-load/usr/lib \
 && cd .. \
 && cd .. \
 && rm -rf gcc-12.2.0 \
 && echo "done gcc"