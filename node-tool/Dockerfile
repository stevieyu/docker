FROM       node:alpine
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    echo http://mirrors.ustc.edu.cn/alpine/edge/testing >> /etc/apk/repositories && \
	apk add --no-cache git ruby python make && \

#镜像配置
    npm config set registry http://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=http://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs && \
	npm config set sqlite3_binary_site=http://npm.taobao.org/mirrors/sqlite3 && \
    npm config set electron_mirror=http://npm.taobao.org/mirrors/electron/ && \
    yarn config set registry 'http://registry.npm.taobao.org' && \

    npm i -g browser-sync whistle spy-debugger vue-cli && \
    npm cache clean --force && \
    yarn cache clean

#browser-sync
EXPOSE 3000 3001
#whistle
EXPOSE 8899
#spy-debugger
EXPOSE 9888

CMD ["sh"]