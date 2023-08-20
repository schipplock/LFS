#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd ${LFS}/sources \
 && rm -rf bash-5.1.16 \
 && tar xf bash-5.1.16.tar.gz \
 && cd bash-5.1.16 \
 && ./configure --prefix=/usr \
    --build=$(support/config.guess) \
    --host=$LFS_TGT \
    --without-bash-malloc \
 && make \
 && make DESTDIR=$LFS install \
 && ln -sv bash $LFS/bin/sh \
 && cd .. \
 && rm -rf bash-5.1.16