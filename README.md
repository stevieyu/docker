# docker

```sh
#使用代理编译
docker build --build-arg HTTPS_PROXY=http://192.168.199.100:1087 -t xxx .

#后台运行基本容器
docker run -idt ubuntu

#杀死所有正在运行的容器
docker kill $(docker ps -a -q)

#删除所有已经停止的容器
docker rm $(docker ps -a -q)

#删除所有未打 dangling 标签的镜像
docker rmi $(docker images -q -f dangling=true)

#进入容器
docker exec -it {container_id} sh

#删除 build cache
docker builder prune

#查看 Docker 的磁盘使用情况
docker system df

#清理磁盘，删除关闭的容器、无用的数据卷和网络，以及 dangling 镜像（即无 tag 的镜像），暂时关闭的容器
docker system prune

#定时清理
EDITOR=vim crontab -e
0 1 * * * docker rm $(docker ps -a -q); docker rmi $(docker images -q -f dangling=true)
```

宿主机ip`172.17.0.1`

## build min image

```sh
docker build  --squash --rm -t nuxt3 .
DOCKER_BUILDKIT=1 docker build --squash --rm -t nuxt3 .
docker buildx build --squash --rm -t nuxt3 .
```

#### other

- https://github.com/slimtoolkit/slim

## 编译开发环境

```sh
# alpine build apk
apk add alpine-sdk build-base


# ubuntu build
apt install -y build-essential


# nix
apt update && apt install -y curl xz-utils && \
sh <(curl -L https://mirrors.bfsu.edu.cn/nix/latest/install) --daemon --yes --no-channel-add && \
echo 'substituters = https://mirrors.bfsu.edu.cn/nix-channels/store https://cache.nixos.org/' >> /etc/nix/nix.conf && \
echo 'https://mirrors.bfsu.edu.cn/nix-channels/nixpkgs-unstable nixpkgs' > $HOME/.nix-channels && \
export PATH=$PATH:$HOME/.nix-profile/bin && \
nix-channel --update

# devbox jetpackio/devbox
nix-env -iA nixpkgs.devbox && devbox global shellenv --recompute && \
echo 'eval "$(devbox global shellenv)"' >> $HOME/.zshrc >> $HOME/.bashrc.d/devbox

# devenv cachix/devenv
nix-env -iA devenv
```

## service

```sh
docker run -d -v $PWD/conf.d:/etc/mysql/conf.d -v $PWD/data:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name mysql mysql --default-authentication-plugin=mysql_native_password

docker run -d -v $PWD/data:/data/db -p 27017:27017 --name mongo mongo

docker run -d -v $PWD/data:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name postgres postgres:alpine

docker run -d -p 6379:6379 --name redis redis:alpine

docker run -d -p 11211:11211 --name memcached memcached:alpine

docker run -d --name yacy -p 8090:8090 -p 8443:8443 --log-opt max-size=200m --log-opt max-file=2 yacy/yacy_search_server

docker run --rm -it --group-add $(id -g) \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -e CODER_HTTP_ADDRESS=0.0.0.0:3000 -p 3000:3000 \
  -e CODER_ACCESS_URL=http://ip172-18-0-9-cqtel4gl2o9000fc0d90-3000.direct.labs.play-with-docker.com \
  ghcr.io/coder/coder:latest

chmod -R a+rw $PWD
docker run -d \
  --name=code-server \
  -u "$(id -u):$(id -g)" \
  -e TZ=Asia/Shanghai \
  -e SUDO_PASSWORD=abc \
  -e DEFAULT_WORKSPACE=/config/workspace \
  -p 8443:8443 \
  --restart unless-stopped \
  lscr.io/linuxserver/code-server:latest
```

## ctop

```sh
docker run --rm -ti \
  --name=ctop \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  quay.io/vektorlab/ctop
```

## 运行限制

```sh
docker run --rm -it -m 256m --memory-swap=256m --cpus 1 -v $PWD:/www -w /www node:alpine sh
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host -it nicolargo/glances
```

## 系统镜像

`curl https://chsrc.run/posix | bash; chsrc set ubuntu|debian|alpine`

`mirrors.cloud.tencent.com`
`repo.huaweicloud.com`
`mirrors.cloud.aliyuncs.com`
`mirrors.aliyun.com`
`mirrors.ustc.edu.cn`
`mirrors.sustech.edu.cn`
`mirrors.cernet.edu.cn`
`mirrors.hust.edu.cn`

```sh
find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g'
```


## ttyd

```sh
curl -k -L -o ttyd https://github.com/tsl0922/ttyd/releases/latest/download/ttyd.x86_64 && chmod +x ttyd
./ttyd -p 8080 bash
```


## docker mirrors

```sh
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "proxies": {
    "http-proxy": "http://192.168.0.104:7890",
    "https-proxy": "http://192.168.0.104:7890",
    "no-proxy": "127.*,192.*,*.cn"
  },
  "registry-mirrors": [
    "https://hub-mirror.c.163.com",
    "https://mirror.baidubce.com"
  ]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

## shadowsocks-libev

```
Encrypt method: rc4-md5,
                aes-128-gcm, aes-192-gcm, aes-256-gcm,
                aes-128-cfb, aes-192-cfb, aes-256-cfb,
                aes-128-ctr, aes-192-ctr, aes-256-ctr,
                camellia-128-cfb, camellia-192-cfb,
                camellia-256-cfb, bf-cfb,
                chacha20-ietf-poly1305,
                xchacha20-ietf-poly1305,
                salsa20, chacha20 and chacha20-ietf.
                The default cipher is chacha20-ietf-poly1305
```

```sh
docker run --restart always -d -p 8388:8388 -p 8388:8388/udp -e  METHOD=aes-256-cfb -e PASSWORD=12345678 --name ss-server shadowsocks/shadowsocks-libev
```

## env
```sh
curl -sfS https://dotenvx.sh | sh
```

## git sync
```sh
git lfs install && git clone --depth=1 https://huggingface.co/defog/llama-3-sqlcoder-8b hf-model && rm -rf hf-model/.git && \
git clone --depth=1 https://oauth2:yzL8vJSiHz7E6FdGTRJ8@www.modelscope.cn/stevie/llama-3-sqlcoder-8b.git ms-model && \
cd ms-model && find . -mindepth 1 -not -path './.git/*' -not -path './.git' -delete && \
mv ../hf-model/.[^.]* . && git add . && git commit -am "sync" && git push
```

### frankenphp
```bash
url="https://www.ghproxy.cn/https://github.com/dunglas/frankenphp/releases/latest/download/frankenphp-linux-x86_64" && \
binpath="/root/.local/bin" && \
curl -L "$url" -o "$binpath"/frankenphp && \
chmod +x "$binpath"/frankenphp && \
echo '#!/usr/bin/env bash\nfrankenphp php-cli "$@"' >> "$binpath"/php && \
chmod +x "$binpath"/php && \
curl -L https://mirrors.aliyun.com/composer/composer.phar -o "$binpath"/composer && \
chmod +x "$binpath"/composer && \
composer config -g repos.packagist composer https://mirrors.tencent.com/composer/ && \
composer install && \
frankenphp php-server
```

### brew

- https://help.mirrors.cernet.edu.cn/homebrew-bottles/

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'export HOMEBREW_API_DOMAIN="https://mirrors.aliyun.com/homebrew-bottles/api"' >> ~/.bash_profile
echo 'export HOMEBREW_BREW_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/brew.git"' >> ~/.bash_profile
echo 'export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.aliyun.com/homebrew/homebrew-core.git"' >> ~/.bash_profile
echo 'export HOMEBREW_BOTTLE_DOMAIN="https://mirrors.aliyun.com/homebrew/homebrew-bottles"' >> ~/.bash_profile
source ~/.bash_profile
brew update
```
