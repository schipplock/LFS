#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# tzselect
ln -sfv /usr/share/zoneinfo/Europe/Berlin /etc/localtime