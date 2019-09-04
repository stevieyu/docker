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
https://caddyserver.com/download/build?os=darwin&arch=amd64&features=cors%2Cfilemanager%2Cgit%2Cjsonp%2Cminify%2Cupload
https://caddyserver.com/download/build?os=linux&arch=amd64&features=cors%2Cfilemanager%2Cgit%2Cjsonp%2Cminify%2Cupload
```

```
# alpine build apk

alpine-sdk
build-base
```

## service
```sh
docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name mysql mysql

docker run -d -p 27017:27017 --name mongo mongo

docker run -d -p 5432:5432 -e POSTGRES_PASSWORD=postgres --name postgres postgres:alpine

docker run -d -p 6379:6379 --name redis redis:alpine

docker run -d -p 11211:11211 --name memcached memcached:alpine
```

## ctop
```sh
docker run --rm -ti \
  --name=ctop \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  quay.io/vektorlab/ctop
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
```
https://github.com/gucong3000/mirror-config-china/blob/master/lib/config.js

chromedriver-cdnurl = "https://npm.taobao.org/mirrors/chromedriver"
couchbase-binary-host-mirror = "https://npm.taobao.org/mirrors/couchbase/v{version}"
debug-binary-host-mirror = "https://npm.taobao.org/mirrors/node-inspector"
disturl = "https://npm.taobao.org/dist"
electron-mirror = "https://npm.taobao.org/mirrors/electron/"
flow-bin-binary-host-mirror = "https://npm.taobao.org/mirrors/flow/v"
fse-binary-host-mirror = "https://npm.taobao.org/mirrors/fsevents"
fuse-bindings-binary-host-mirror = "https://npm.taobao.org/mirrors/fuse-bindings/v{version}"
git4win-mirror = "https://npm.taobao.org/mirrors/git-for-windows"
gl-binary-host-mirror = "https://npm.taobao.org/mirrors/gl/v{version}"
grpc-node-binary-host-mirror = "https://npm.taobao.org/mirrors"
hackrf-binary-host-mirror = "https://npm.taobao.org/mirrors/hackrf/v{version}"
leveldown-binary-host-mirror = "https://npm.taobao.org/mirrors/leveldown/v{version}"
leveldown-hyper-binary-host-mirror = "https://npm.taobao.org/mirrors/leveldown-hyper/v{version}"
mknod-binary-host-mirror = "https://npm.taobao.org/mirrors/mknod/v{version}"
node-sqlite3-binary-host-mirror = "https://npm.taobao.org/mirrors"
node-tk5-binary-host-mirror = "https://npm.taobao.org/mirrors/node-tk5/v{version}"
nodegit-binary-host-mirror = "https://npm.taobao.org/mirrors/nodegit/v{version}/"
operadriver-cdnurl = "https://npm.taobao.org/mirrors/operadriver"
phantomjs-cdnurl = "https://npm.taobao.org/mirrors/phantomjs"
profiler-binary-host-mirror = "https://npm.taobao.org/mirrors/node-inspector/"
puppeteer-download-host = "https://npm.taobao.org/mirrors"
python-mirror = "https://npm.taobao.org/mirrors/python"
rabin-binary-host-mirror = "https://npm.taobao.org/mirrors/rabin/v{version}"
registry = "https://registry.npm.taobao.org/"
sass-binary-site = "https://npm.taobao.org/mirrors/node-sass"
sodium-prebuilt-binary-host-mirror = "https://npm.taobao.org/mirrors/sodium-prebuilt/v{version}"
sqlite3-binary-site = "https://npm.taobao.org/mirrors/sqlite3"
utf-8-validate-binary-host-mirror = "https://npm.taobao.org/mirrors/utf-8-validate/v{version}"
utp-native-binary-host-mirror = "https://npm.taobao.org/mirrors/utp-native/v{version}"
zmq-prebuilt-binary-host-mirror = "https://npm.taobao.org/mirrors/zmq-prebuilt/v{version}"
```

