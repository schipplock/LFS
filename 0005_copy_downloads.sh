#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

require-root-user

mkdir -v ${LFS}/sources
chmod -v a+wt ${LFS}/sources
cp -R ${SCRIPT_DIR}/downloads/* ${LFS}/sources
cp ${SCRIPT_DIR}/files/kernel_config ${LFS}/sources

echo "done copying downloads to ${LFS}/sources"