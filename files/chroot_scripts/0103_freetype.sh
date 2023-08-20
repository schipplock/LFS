#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf freetype-2.13.0 \
 && tar xf freetype-2.13.0.tar.xz \
 && cd freetype-2.13.0 \
 && sed -ri "s:.*(AUX_MODULES.*valid):\1:" modules.cfg \
 && sed -r "s:.*(#.*SUBPIXEL_RENDERING) .*:\1:" -i include/freetype/config/ftoption.h \
 && ./configure --prefix=/usr --enable-freetype-config --disable-static \
 && make \
 && make install \
 && cd .. \
 && rm -rf freetype-2.13.0 \
 && echo "done freetype"