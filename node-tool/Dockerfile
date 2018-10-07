FROM       alpine:edge
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache nodejs nodejs-npm git python make g++ && \

#镜像配置
    npm config set registry http://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=http://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs && \

    npm i -g browser-sync whistle spy-debugger vue-cli && \
    npm cache clean --force

#browser-sync
EXPOSE 3000 3001
#whistle
EXPOSE 8899
#spy-debugger
EXPOSE 9888

CMD ["sh"]