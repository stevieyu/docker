#!/bin/bash


mirror_OS=mirrors.ustc.edu.cn
mirror_GO=goproxy.cn

# curl -L https://github.com/stevieyu/docker/raw/master/mirror.sh | sudo bash
# curl -L https://gcore.jsdelivr.net/gh/stevieyu/docker/mirror.sh | sudo bash

use_sudo() { [ "$(id -u)" = "0" ] || sudo "$@"; }

if command -v apt &> /dev/null || command -v apk &> /dev/null; then
  use_sudo find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | use_sudo xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/'$mirror_OS'/g'
  echo "设置apt或者apk镜像"
fi


if command -v go &> /dev/null; then
  go env -w GOPROXY=https://$mirror_GO,direct && go env -w GO111MODULE=on && go env -w GONOSUMDB=off
  echo "设置go镜像"
fi
