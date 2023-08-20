#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

filename=MarkupSafe-2.1.1.tar.gz

extension=.$(echo ${filename} | awk -F'[.]' '{print $(NF-1)"."$NF}')
directory=$(basename ${filename} ${extension})

cd sources \
 && rm -rf ${directory} \
 && tar xf ${filename} \
 && cd ${directory} \
 && pip3 wheel -w dist --no-build-isolation --no-deps $PWD \
 && pip3 install --no-index --no-user --find-links dist Markupsafe \
 && cd .. \
 && rm -rf ${directory} \
 && echo "done ${directory}"