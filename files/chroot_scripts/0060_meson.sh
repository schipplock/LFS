#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd sources \
 && rm -rf meson-0.63.1 \
 && tar xf meson-0.63.1.tar.gz \
 && cd meson-0.63.1 \
 && pip3 wheel -w dist --no-build-isolation --no-deps $PWD \
 && pip3 install --no-index --find-links dist meson \
 && install -vDm644 data/shell-completions/bash/meson /usr/share/bash-completion/completions/meson \
 && install -vDm644 data/shell-completions/zsh/_meson /usr/share/zsh/site-functions/_meson \
 && cd .. \
 && rm -rf meson-0.63.1 \
 && echo "done meson"