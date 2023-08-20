#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf sed-4.8 \
 && tar xf sed-4.8.tar.xz \
 && cd sed-4.8 \
 && ./configure --prefix=/usr \
 && make \
 && make html \
 && make install \
 && install -d -m755 /usr/share/doc/sed-4.8 \
 && install -m644 doc/sed.html /usr/share/doc/sed-4.8 \
 && cd .. \
 && rm -rf sed-4.8 \
 && echo "done sed"