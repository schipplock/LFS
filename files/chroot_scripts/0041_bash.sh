#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf bash-5.1.16 \
 && tar xf bash-5.1.16.tar.gz \
 && cd bash-5.1.16 \
 && ./configure --prefix=/usr \
    --docdir=/usr/share/doc/bash-5.1.16 \
    --without-bash-malloc \
    --with-installed-readline \
 && make \
 && make install \
 && cd .. \
 && rm -rf bash-5.1.16 \
 && echo "done bash"