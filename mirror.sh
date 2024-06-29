#!/bin/bash


mirror_OS=mirrors.ustc.edu.cn
mirror_GO=goproxy.cn

# curl -L https://github.com/stevieyu/docker/raw/master/mirror.sh | sudo bash
# curl -L https://gcore.jsdelivr.net/gh/stevieyu/docker/mirror.sh | sudo bash

with_sudo() {
    if [ "$(id -u)" != "0" ]; then
        sudo "$@"
    else
        "$@"
    fi
}

if command -v apt &> /dev/null || command -v apk &> /dev/null; then
  with_sudo find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | with_sudo xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/'$mirror_OS'/g'
  echo "设置apt或者apk镜像"
fi


if command -v go &> /dev/null; then
  go env -w GOPROXY=https://$mirror_GO,direct && go env -w GO111MODULE=on && go env -w GONOSUMDB=off
  curl -sSfL https://gcore.jsdelivr.net/gh/air-verse/air/install.sh | sh -s
  echo "设置go镜像"
fi
