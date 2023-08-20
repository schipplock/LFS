#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf ninja-1.11.0 \
 && tar xf ninja-1.11.0.tar.gz \
 && cd ninja-1.11.0 \
 && python3 configure.py --bootstrap \
 && install -vm755 ninja /usr/bin/ \
 && install -vDm644 misc/bash-completion /usr/share/bash-completion/completions/ninja \
 && install -vDm644 misc/zsh-completion /usr/share/zsh/site-functions/_ninja \
 && cd .. \
 && rm -rf ninja-1.11.0 \
 && echo "done ninja"