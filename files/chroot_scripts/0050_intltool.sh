#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf intltool-0.51.0 \
 && tar xf intltool-0.51.0.tar.gz \
 && cd intltool-0.51.0 \
 && sed -i 's:\\\${:\\\$\\{:' intltool-update.in \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && install -v -Dm644 doc/I18N-HOWTO /usr/share/doc/intltool-0.51.0/I18N-HOWTO \
 && cd .. \
 && rm -rf intltool-0.51.0 \
 && echo "done intltool"