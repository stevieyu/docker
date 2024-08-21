#!/bin/bash
curl -L https://fastly.jsdelivr.net/gh/stevieyu/docker/devbox.sh | bash -s --

MIRROR_HOST=mirrors.bfsu.edu.cn

use_sudo() { [ "$(id -u)" = "0" ] || sudo "$@"; }

if ! command -v xz &> /dev/null; then
  use_sudo apt install -y xz-utils


  if ! command -v nix &> /dev/null; then
    sh <(curl -L https://$MIRROR_HOST/nix/latest/install) --daemon --yes --no-channel-add && \
    echo "substituters = https://$MIRROR_HOST/nix-channels/store https://cache.nixos.org/" >> /etc/nix/nix.conf && \
    echo "https://$MIRROR_HOST/nix-channels/nixpkgs-unstable nixpkgs" > $HOME/.nix-channels && \
    export PATH=$PATH:$HOME/.nix-profile/bin && \
    nix-channel --update


    if ! command -v devbox &> /dev/null; then
      nix-env -iA nixpkgs.devbox && devbox global shellenv --recompute && \
      echo 'eval "$(devbox global shellenv)"' >> $HOME/.zshrc >> $HOME/.bashrc.d/devbox
    fi


    
  fi
  



  
fi


