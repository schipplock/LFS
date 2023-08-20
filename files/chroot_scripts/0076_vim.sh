#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

filename=vim-9.0.0228.tar.gz

extension=.$(echo ${filename} | awk -F'[.]' '{print $(NF-1)"."$NF}')
directory=$(basename ${filename} ${extension})

cd sources \
 && rm -rf ${directory} \
 && tar xf ${filename} \
 && cd ${directory} \
 && echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h \
 && ./configure --prefix=/usr \
 && make \
 && make install \
 && ln -svf ../vim/vim90/doc /usr/share/doc/vim-9.0.0228 \
 && cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc
" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1
set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif
" End /etc/vimrc
EOF
 cd .. \
 && rm -rf ${directory} \
 && echo "done ${directory}"