#!/bin/sh

curl -L -o tun2proxy.zip https://github.com/tun2proxy/tun2proxy/releases/latest/download/tun2proxy-x86_64-unknown-linux-gnu.zip
unzip tun2proxy.zip -d ~/.cache/tun2proxy
rm ./*.zip

export PATH=$PATH:~/.cache/tun2proxy

# tun2proxy --setup --proxy socks5://192.168.0.100:7890
