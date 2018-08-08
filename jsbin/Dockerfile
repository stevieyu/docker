FROM       alpine:edge
MAINTAINER Stevie "https://github.com/yzm629"

WORKDIR /root

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache nodejs nodejs-npm git python make g++

RUN apk add --no-cache mysql mysql-client && \
    mkdir /run/mysqld && \
    mysql_install_db --user=root > /dev/null && \
    mysqld_safe --user=root&

	#镜像切换
RUN	npm config set registry https://registry.npm.taobao.org && \
	npm config set disturl https://npm.taobao.org/dist && \
	npm config set loglevel http && \
	npm config set SASS_BINARY_SITE https://npm.taobao.org/mirrors/node-sass && \
	npm config set PHANTOMJS_CDNURL https://npm.taobao.org/mirrors/phantomjs && \
	npm config set SQLITE3_BINARY_SITE http://npm.taobao.org/mirrors/sqlite3 && \
	npm config set ELECTRON_MIRROR http://npm.taobao.org/mirrors/electron/ && \

	#安装jsbin
	git clone --depth=1 https://gitee.com/yzm94/jsbin.git /root/jsbin && \
    cd /root/jsbin && \
    npm i && \
    npm run build

WORKDIR /root/jsbin

ADD ./config.local.json ./

EXPOSE 3000

CMD ["./bin/jsbin"]
