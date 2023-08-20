#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf gdbm-1.23 \
 && tar xf gdbm-1.23.tar.gz \
 && cd gdbm-1.23 \
 && ./configure --prefix=/usr --disable-static --enable-libgdbm-compat \
 && make \
 && make install \
 && cd .. \
 && rm -rf gdbm-1.23 \
 && echo "done gdbm"