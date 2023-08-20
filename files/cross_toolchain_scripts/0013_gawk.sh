#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf gawk-5.1.1 \
 && tar xf gawk-5.1.1.tar.xz \
 && cd gawk-5.1.1 \
 && sed -i 's/extras//' Makefile.in \
 && ./configure --prefix=/usr \
    --host=$LFS_TGT \
    --build=$(build-aux/config.guess) \
 && make \
 && make DESTDIR=$LFS install \
 && cd .. \
 && rm -rf gawk-5.1.1