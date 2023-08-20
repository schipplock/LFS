#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

require-root-user

# nur, um zu testen, ob das Environment richtig gesetzt ist/wird

runuser -u lfs -- env -i HOME=/home/lfs TERM=xterm-256color PS1='\u:\w\$ ' /bin/bash -i -c env

echo "done"