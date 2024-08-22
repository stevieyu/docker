#!/bin/bash
# curl -L https://fastly.jsdelivr.net/gh/stevieyu/docker/devbox.sh | bash -s --

export MIRROR_HOST=mirrors.ustc.edu.cn

use_sudo() { [ "$(id -u)" = "0" ] || sudo "$@"; }

if command -v xz &> /dev/null 2>&1; then
  echo 'xz已安装'
else
  use_sudo apt install -y xz-utils
fi


if command -v xz &> /dev/null 2>&1 && command -v nix &> /dev/null 2>&1; then
  echo 'nix已安装'
else
  export PATH=$PATH:$HOME/.nix-profile/bin && \
  sh <(curl -L https://$MIRROR_HOST/nix/latest/install) --daemon --yes --no-channel-add && \
  echo "substituters = https://$MIRROR_HOST/nix-channels/store https://cache.nixos.org/" >> /etc/nix/nix.conf && \
  nix-channel --add https://$MIRROR_HOST/nix-channels/nixpkgs-unstable nixpkgs
  nix-channel --update
fi


if command -v nix-env &> /dev/null 2>&1 && ! command -v devbox &> /dev/null 2>&1; then
  echo 'devbox已安装'
else
  nix-env -iA nixpkgs.devbox && devbox global shellenv --recompute && \
  echo 'eval "$(devbox global shellenv)"' >> $HOME/.zshrc >> $HOME/.bashrc.d/devbox
fi
