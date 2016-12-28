FROM       ubuntu:devel
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
#RUN sed -i 's/httpredir.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y curl build-essential python make

#nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs

#nodejs tools
RUN npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=https://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=https://npm.taobao.org/mirrors/phantomjs && \
    npm install -g node-gyp && \
    npm i -g yarn && \
    yarn config set registry 'https://registry.npm.taobao.org'

CMD ["node"]
