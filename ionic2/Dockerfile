FROM       beevelop/android
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y wget python make build-essential apt-transport-https lsb-release

#nodejs
RUN wget -qO- https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo 'deb https://deb.nodesource.com/node_6.x wily main' > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && \
    apt-get install -y nodejs

RUN npm config set registry https://registry.npm.taobao.org && \
    npm install -g --unsafe-perm node-gyp ionic@beta cordova --registry=https://registry.npm.taobao.org

#ionic hooks add

CMD ["node"]
