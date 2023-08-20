#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf iana-etc-20220812 \
 && tar xf iana-etc-20220812.tar.gz \
 && cd iana-etc-20220812 \
 && cp services protocols /etc \
 && cd .. \
 && rm -rf iana-etc-20220812 \
 && echo "done iana-etc"