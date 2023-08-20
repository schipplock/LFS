#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf Python-3.10.6 \
 && tar xf Python-3.10.6.tar.xz \
 && cd Python-3.10.6 \
 && ./configure --prefix=/usr \
    --enable-shared \
    --with-system-expat \
    --with-system-ffi \
    --enable-optimizations \
 && make \
 && make install \
 && echo "[global]" > /etc/pip.conf \
 && echo "root-user-action = ignore" >> /etc/pip.conf \
 && echo "disable-pip-version-check = true" >> /etc/pip.conf \
 && install -v -dm755 /usr/share/doc/python-3.10.6/html \
 && tar --strip-components=1 \
    --no-same-owner \
    --no-same-permissions \
    -C /usr/share/doc/python-3.10.6/html \
    -xvf ../python-3.10.6-docs-html.tar.bz2 \
 && cd .. \
 && rm -rf Python-3.10.6 \
 && echo "done python"