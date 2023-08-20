#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf XML-Parser-2.46 \
 && tar xf XML-Parser-2.46.tar.gz \
 && cd XML-Parser-2.46 \
 && perl Makefile.PL \
 && make \
 && make install \
 && cd .. \
 && rm -rf XML-Parser-2.46 \
 && echo "done xmlparser"