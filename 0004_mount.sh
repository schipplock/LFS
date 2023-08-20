#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

require-root-user

mkdir -pv ${LFS}
mount -v -t ext4 ${TARGET_DEVICE}p3 ${LFS}
/sbin/swapon -v ${TARGET_DEVICE}p2

echo "done mounting"