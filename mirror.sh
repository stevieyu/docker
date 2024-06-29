#!/bin/bash

mirror_OS=mirrors.ustc.edu.cn

# 使用逻辑或检查 apt 和 apk 是否存在任意一个
if command -v apt &> /dev/null || command -v apk &> /dev/null; then
  echo "设置apt或者apk镜像"
  find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/$mirror_OS/g'
fi


