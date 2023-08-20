#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf man-pages-5.13 \
 && tar xf man-pages-5.13.tar.xz \
 && cd man-pages-5.13 \
 && make prefix=/usr install \
 && cd .. \
 && rm -rf man-pages-5.13 \
 && echo "done man-pages"