#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf gettext-0.21 \
 && tar xf gettext-0.21.tar.xz \
 && cd gettext-0.21 \
 && ./configure --prefix=/usr \
    --disable-static \
    --docdir=/usr/share/doc/gettext-0.21 \
 && make \
 && make install \
 && chmod -v 0755 /usr/lib/preloadable_libintl.so \
 && cd .. \
 && rm -rf gettext-0.21 \
 && echo "done gettext"