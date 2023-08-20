#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
source ${SCRIPT_DIR}/_reusables.sh

require-root-user

bash ./0004_mount.sh
bash ./0005_copy_downloads.sh
bash ./0006_directory_layout.sh
bash ./0010_chroot_preps.sh
