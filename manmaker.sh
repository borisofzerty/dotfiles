#!/bin/bash
mp='/tmp/mp.man'

[ $# -lt 1 ] && echo "usage: $0 [section] manpage" && exit 1

# 3 columns are reserved for linenumbers in vim
# TODO: dynamically obtain this value
export MANWIDTH=$(($(tput cols) - 3))

man $* > $mp || exit 1 && vim $mp
