#!/bin/bash
home=$(realpath ~)
script="$home/.fzf/install"
if [ ! -f "$script" ]; then
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
  sed -i 's/wget /wget -q /g' $script
  $script --all
fi
