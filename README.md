#docker

```sh
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

```sh
# 创建一台安装有Docker环境的virtualbox Linux虚拟机，指定机器名称为default，同时配置Docker加速器地址。
docker-machine create --engine-registry-mirror=https://8dqe4zuz.mirror.aliyuncs.com -d virtualbox default

# 查看机器的环境配置，并配置到本地。然后通过Docker客户端访问Docker服务。
docker-machine env default
eval "$(docker-machine env default)"
docker info
```

宿主机ip`172.17.0.1`

#### caddy link
```
https://caddyserver.com/download/build?os=darwin&arch=amd64&features=cors%2Cfilemanager%2Cgit%2Cjsonp%2Cminify%2Cupload
https://caddyserver.com/download/build?os=linux&arch=amd64&features=cors%2Cfilemanager%2Cgit%2Cjsonp%2Cminify%2Cupload
```