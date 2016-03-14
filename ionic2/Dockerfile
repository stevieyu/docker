FROM       beevelop/android
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
#RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y wget python make build-essential apt-transport-https lsb-release

#nodejs
RUN wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo 'deb https://deb.nodesource.com/node_4.x wily main' > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs

RUN npm config set registry https://registry.npm.taobao.org && \
    npm install -g --unsafe-perm ionic@beta cordova@6.0.0 --registry=https://registry.npm.taobao.org

#ionic hooks add

CMD ["node"]
