#!/bin/bash

mirror_OS=mirrors.ustc.edu.cn
mirror_GO=goproxy.cn


if command -v apt &> /dev/null || command -v apk &> /dev/null; then
  find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/'$mirror_OS'/g'
  echo "设置apt或者apk镜像"
fi


if command -v go &> /dev/null; then
  go env -w GOPROXY=https://$mirror_GO,direct && go env -w GO111MODULE=on && go env -w GONOSUMDB=off
  curl -sSfL https://gcore.jsdelivr.net/gh/air-verse/air/install.sh | sh -s
  echo "设置go镜像"
fi
