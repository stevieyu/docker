FROM       beevelop/android
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y curl python make build-essential

#nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get update && apt-get install -y nodejs && \
    npm config set registry https://registry.npm.taobao.org && \
    npm install -g --unsafe-perm node-gyp ionic@beta cordova --registry=https://registry.npm.taobao.org

#ionic hooks add
#docker run --rm -it -p 8100:8100 -p 35729:35729 --privileged -v e:/code/nodejs/ionic:/root/data -w /root/data i2 bash

CMD ["node"]
