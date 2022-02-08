#docker

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
```

宿主机ip`172.17.0.1`

#### caddy link
```
https://caddyserver.com/download/build?os=linux&arch=amd64&features=cors%2Cfilemanager%2Cgit%2Cjsonp%2Cminify%2Cupload
```

```
# alpine build apk

alpine-sdk
build-base

# ubuntu build
build-essential
```

## service
```sh
podman run --net=host
docker run -d -v $PWD/conf.d:/etc/mysql/conf.d -v $PWD/data:/var/lib/mysql -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name mysql mysql --default-authentication-plugin=mysql_native_password

docker run -d -v $PWD/data:/data/db -p 27017:27017 --name mongo mongo

docker run -d -v $PWD/data:/var/lib/postgresql/data -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name postgres postgres:alpine

docker run -d -p 6379:6379 --name redis redis:alpine

docker run -d -p 11211:11211 --name memcached memcached:alpine

docker run -d --name yacy -p 8090:8090 -p 8443:8443 --log-opt max-size=200m --log-opt max-file=2 yacy/yacy_search_server
```

## ctop
```sh
docker run --rm -ti \
  --name=ctop \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  quay.io/vektorlab/ctop

echo "deb http://packages.azlux.fr/debian/ buster main" | sudo tee /etc/apt/sources.list.d/azlux.list && \
wget -qO - https://azlux.fr/repo.gpg.key | apt-key add - && \
apt update && apt install docker-ctop
```

```
docker run --rm -it -m 256m --memory-swap=256m --cpus 1 -v $PWD:/www -w /www node:alpine sh
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host -it nicolargo/glances
```

## drone
```sh
docker run \
  --volume=/var/run/docker.sock:/var/run/docker.sock \
  --volume=/var/lib/drone:/data \
  --env=DRONE_USER_CREATE=username:stevieyu,admin:true \
  --env=DRONE_GITHUB_SERVER=https://github.com \
  --env=DRONE_GITHUB_CLIENT_ID=e67a849c443ffb962743 \
  --env=DRONE_GITHUB_CLIENT_SECRET=33189774f574508b8d38b303c83607d2364627a6 \
  --env=DRONE_RUNNER_CAPACITY=2 \
  --env=DRONE_SERVER_HOST=119.29.205.85 \
  --env=DRONE_SERVER_PROTO=http \
  --env=DRONE_TLS_AUTOCERT=false \
  --publish=80:80 \
  --publish=443:443 \
  --restart=always \
  --detach=true \
  --name=drone \
  drone/drone
```

## graphql-engine
```sh
docker run -d -p 8080:8080 \
  -e HASURA_GRAPHQL_DATABASE_URL=postgres://ywsestdn:umWT_4hbj6Duw__mF0xBeuvNBdRRUg5M@satao.db.elephantsql.com:5432/ywsestdn \
  -e HASURA_GRAPHQL_ENABLE_CONSOLE=true \
  --name graphql-engine \
  hasura/graphql-engine
```

### npm mirrors config 
`curl -k -o ~/.npmrc https://cdn.jsdelivr.net/gh/stevieyu/stevieyu.github.io/.npmrc`
```
https://github.com/gucong3000/mirror-config-china/blob/master/lib/config.js

metrics-registry=https://registry.npm.taobao.org/
chromedriver-cdnurl=https://npm.taobao.org/mirrors/chromedriver
couchbase-binary-host-mirror=https://npm.taobao.org/mirrors/couchbase/v{version}
debug-binary-host-mirror=https://npm.taobao.org/mirrors/node-inspector
disturl=https://npm.taobao.org/dist
electron-mirror=https://npm.taobao.org/mirrors/electron/
flow-bin-binary-host-mirror=https://npm.taobao.org/mirrors/flow/v
fse-binary-host-mirror=https://npm.taobao.org/mirrors/fsevents
fuse-bindings-binary-host-mirror=https://npm.taobao.org/mirrors/fuse-bindings/v{version}
git4win-mirror=https://npm.taobao.org/mirrors/git-for-windows
gl-binary-host-mirror=https://npm.taobao.org/mirrors/gl/v{version}
grpc-node-binary-host-mirror=https://npm.taobao.org/mirrors
hackrf-binary-host-mirror=https://npm.taobao.org/mirrors/hackrf/v{version}
leveldown-binary-host-mirror=https://npm.taobao.org/mirrors/leveldown/v{version}
leveldown-hyper-binary-host-mirror=https://npm.taobao.org/mirrors/leveldown-hyper/v{version}
mknod-binary-host-mirror=https://npm.taobao.org/mirrors/mknod/v{version}
node-sqlite3-binary-host-mirror=https://npm.taobao.org/mirrors
node-tk5-binary-host-mirror=https://npm.taobao.org/mirrors/node-tk5/v{version}
nodegit-binary-host-mirror=https://npm.taobao.org/mirrors/nodegit/v{version}/
operadriver-cdnurl=https://npm.taobao.org/mirrors/operadriver
phantomjs-cdnurl=https://npm.taobao.org/mirrors/phantomjs
profiler-binary-host-mirror=https://npm.taobao.org/mirrors/node-inspector/
puppeteer-download-host=https://npm.taobao.org/mirrors
python-mirror=https://npm.taobao.org/mirrors/python
rabin-binary-host-mirror=https://npm.taobao.org/mirrors/rabin/v{version}
registry=https://registry.npm.taobao.org
sass-binary-site=https://npm.taobao.org/mirrors/node-sass
sodium-prebuilt-binary-host-mirror=https://npm.taobao.org/mirrors/sodium-prebuilt/v{version}
sqlite3-binary-site=https://npm.taobao.org/mirrors/sqlite3
utf-8-validate-binary-host-mirror=https://npm.taobao.org/mirrors/utf-8-validate/v{version}
utp-native-binary-host-mirror=https://npm.taobao.org/mirrors/utp-native/v{version}
zmq-prebuilt-binary-host-mirror=https://npm.taobao.org/mirrors/zmq-prebuilt/v{version}
```

### go proxy
```sh
go env -w GOPROXY=https://goproxy.cn,direct
```

### docker mirrors
`http://hub-mirror.c.163.com`

```
sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://8dqe4zuz.mirror.aliyuncs.com"]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker
```

### shadowsocks-libev
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

### install docker
```sh
apt update && \
apt install -y apt-transport-https ca-certificates software-properties-common curl && \
curl -fsSL http://mirrors.aliyun.com/docker-ce/linux/ubuntu/gpg | apt-key add - && \
add-apt-repository "deb [arch=amd64] http://mirrors.aliyun.com/docker-ce/linux/ubuntu $(lsb_release -cs) stable" && \
apt update && \
apt install -y docker-ce && \
docker version
```

#### 非 root 用户
```sh
sudo usermod -aG docker $USER
```
新开终端

### install docker composer
```sh
curl -L https://github.com/docker/compose/releases/download/1.25.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose
```

### install dokku
```sh
wget -nv -O - https://packagecloud.io/dokku/dokku/gpgkey | apt-key add - && \
export SOURCE="https://packagecloud.io/dokku/dokku/ubuntu/" && \
export OS_ID="$(lsb_release -cs 2>/dev/null || echo "trusty")" && \
echo "utopicvividwilyxenialyakketyzestyartfulbionic" | grep -q "$OS_ID" || OS_ID="trusty" && \
echo "deb $SOURCE $OS_ID main" | tee /etc/apt/sources.list.d/dokku.list && \
apt-get update && \
apt-get install -y dokku && \
dokku plugin:install-dependencies --core
```

#### dokku config
```sh
dokku config:set --global NPM_CONFIG_PRODUCTION=false DOKKU_LETSENCRYPT_EMAIL=dgjx163@163.com
```

### install podman,buildah,skopeo
```sh
apt install -y software-properties-common uidmap slirp4netns && \
add-apt-repository -y ppa:projectatomic/ppa && \
apt update -y && \
apt -y install podman buildah skopeo && \
echo -e "[registries.search]\nregistries = ['docker.io', 'quay.io']" | sudo tee /etc/containers/registries.conf && \
wget -O /etc/containers/policy.json -e robots=off https://raw.githubusercontent.com/containers/skopeo/master/default-policy.json
```

### install kubernetes
```sh
apt-get update && apt-get install -y apt-transport-https && \
curl http://mirrors.cloud.aliyuncs.com/kubernetes/apt/doc/apt-key.gpg | apt-key add - && \
echo "deb http://mirrors.cloud.aliyuncs.com/kubernetes/apt/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list && \
apt update && \
apt-get install -y kubelet kubeadm kubectl
```

### 定时清理
```sh
EDITOR=vim crontab -e

0 1 * * * docker rm $(docker ps -a -q); docker rmi $(docker images -q -f dangling=true)
```

