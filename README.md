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