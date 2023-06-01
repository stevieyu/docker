#!/bin/sh

apt update

ARCH=$(uname -m)
if [ "$ARCH" = "x86_64" ]; then
    ARCH=amd64
elif [ "$ARCH" = "aarch64" ]; then
    ARCH=arm64
fi

##############################################################################

downloadUrl="https://go.dev/dl/go1.20.4.linux-$ARCH.tar.gz"
if command -v go &> /dev/null; then
    echo "跳过 Go 安装"
else
    curl -k -L $downloadUrl | tar -C /usr/local -xzf
    export PATH=$PATH:/usr/local/go/bin
fi
go version

##############################################################################

if command -v deno &> /dev/null; then
    echo "跳过 Deno 安装"
else
    sudo apt install -y unzip
    curl -kfsSL https://deno.land/x/install/install.sh | sh
    export DENO_INSTALL=$HOME/.deno
    export PATH=$DENO_INSTALL/bin:$PATH
fi
go -V

##############################################################################

if command -v cargo &> /dev/null; then
    echo "跳过 Rust 安装"
else
    curl -kfsSL https://sh.rustup.rs | sh -s -- -y
fi


