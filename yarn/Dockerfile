FROM       alpine:edge
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update && \
    apk add nodejs && \
    npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=https://npm.taobao.org/mirrors/node-sass && \
    npm i -g yarn

CMD ["yarn"]