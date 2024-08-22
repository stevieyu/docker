#!/bin/bash
# curl -L https://fastly.jsdelivr.net/gh/stevieyu/docker/devbox.sh | bash -s --



use_sudo() { [ "$(id -u)" = "0" ] || sudo "$@"; }

use_sudo apt install -y xz-utils

export PATH=$PATH:$HOME/.nix-profile/bin && \
sh <(curl -L https://mirrors.bfsu.edu.cn/nix/latest/install) --daemon --yes --no-channel-add && \
echo "substituters = https://yzmxg.oss-cn-hongkong.aliyuncs.com/nix-channels/store https://cache.nixos.org/" >> /etc/nix/nix.conf && \
nix-channel --add https://mirrors.ustc.edu.cn/nix-channels/nixpkgs-unstable nixpkgs && \
nix-channel --update



nix-env -iA nixpkgs.devbox && eval $(devbox global shellenv --recompute) && \
echo 'eval "$(devbox global shellenv)"' >> $HOME/.zshrc >> $HOME/.bashrc

