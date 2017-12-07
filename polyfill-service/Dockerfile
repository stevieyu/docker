FROM       alpine:edge
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    echo http://mirrors.ustc.edu.cn/alpine/edge/testing >> /etc/apk/repositories && \
	apk add --no-cache nodejs git python make g++ && \

    npm config set registry http://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=http://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs && \
	npm config set sqlite3_binary_site=http://npm.taobao.org/mirrors/sqlite3 && \
    npm config set electron_mirror=http://npm.taobao.org/mirrors/electron/

RUN git clone --depth=1 https://github.com/Financial-Times/polyfill-service.git && \
	cd polyfill-service && \
	npm i && \
    npm run build

EXPOSE 3000

WORKDIR /root/polyfill-service

CMD ["npm", "start"]