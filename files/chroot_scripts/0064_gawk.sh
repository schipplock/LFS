#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf gawk-5.1.1 \
 && tar xf gawk-5.1.1.tar.xz \
 && cd gawk-5.1.1 \
 && sed -i 's/extras//' Makefile.in \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && mkdir -pv /usr/share/doc/gawk-5.1.1 \
 && cp -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.1.1 \
 && cd .. \
 && rm -rf gawk-5.1.1 \
 && echo "done gawk"