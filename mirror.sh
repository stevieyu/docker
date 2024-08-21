#!/bin/bash
# curl -L https://gcore.jsdelivr.net/gh/stevieyu/docker/mirror.sh | sudo bash

mirror_OS=mirrors.ustc.edu.cn
mirror_GO=goproxy.cn



use_sudo() { [ "$(id -u)" = "0" ] || sudo "$@"; }

if command -v xz &> /dev/null; then
  use_sudo apt update
  use_sudo apt install -y xz-utils
  echo "支持xz"
fi

if command -v apt &> /dev/null || command -v apk &> /dev/null; then
  use_sudo find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | use_sudo xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/'$mirror_OS'/g'
  echo "设置apt或者apk镜像"
fi


if command -v go &> /dev/null; then
  go env -w GOPROXY=https://$mirror_GO,direct && go env -w GO111MODULE=on && go env -w GONOSUMDB=off
  echo "设置go镜像"
fi

if command -v npm &> /dev/null; then
  curl -k -o ~/.npmrc https://gcore.jsdelivr.net/gh/stevieyu/docker/.npmrc
  echo "设置npm镜像"
fi

