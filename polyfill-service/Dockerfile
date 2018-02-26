FROM       alpine:edge
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/edge/testing >> /etc/apk/repositories && \
	apk add --no-cache nodejs nodejs-npm git python make g++ && \

    npm config set registry http://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=http://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs && \

    git clone --depth=1 https://github.com/Financial-Times/polyfill-service.git && \
	cd polyfill-service && \
	npm install && \
    npm run build && \
    npm cache clear --force

EXPOSE 3000

WORKDIR /root/polyfill-service

CMD ["npm", "start"]