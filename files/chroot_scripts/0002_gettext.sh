#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf gettext-0.21 \
 && tar xf gettext-0.21.tar.xz \
 && cd gettext-0.21 \
 && ./configure --disable-shared \
 && make \
 && cp -v gettext-tools/src/{msgfmt,msgmerge,xgettext} /usr/bin \
 && cd .. \
 && rm -rf gettext-0.21