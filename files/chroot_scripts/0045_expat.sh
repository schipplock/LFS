#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf expat-2.4.8 \
 && tar xf expat-2.4.8.tar.xz \
 && cd expat-2.4.8 \
 && ./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/expat-2.4.8 \
 && make \
 && make install \
 && install -v -m644 doc/*.{html,css} /usr/share/doc/expat-2.4.8 \
 && cd .. \
 && rm -rf expat-2.4.8 \
 && echo "done expat"