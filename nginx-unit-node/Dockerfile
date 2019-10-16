FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

ENV UNIT_VERSION=1.12.0

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
	apk add --no-cache nodejs-current nodejs-current-npm curl && \
	# 安装编译依赖
    apk add --no-cache --virtual .build-deps alpine-sdk python && \
    # 设置 node 环境配置
    npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm i -g node-gyp && \
    # 下载解压
    curl -L https://unit.nginx.org/download/unit-$UNIT_VERSION.tar.gz -o unit.tar.gz && \
    tar -xzvf unit.tar.gz && mv unit-$UNIT_VERSION unit && \
    # 配置 & 安装
    cd unit && \
    ./configure \
		--prefix="/usr" \
		--state="/var/lib/unit" \
		--control="unix:/run/control.unit.sock" \
		--pid="/run/unit.pid" \
		--log="/var/log/unit.log" \
		--modules="/usr/lib/unit/modules" && \
	./configure nodejs && \
	make install && \
	make node-install && \
	apk del .build-deps && \
	rm -rf unit* && npm uninstall node-gyp -g && npm cache clean -f

	# 配置 demo 环境
COPY app/package.json /www/
WORKDIR /www

RUN npm i && \
	npm link unit-http && \
	npm cache clean -f

	# unit 配置
COPY config.json /root/
COPY app /www/
RUN chmod +x app.js && \
	unitd --control unix:/run/control.unit.sock && \
	curl -X PUT --data-binary @/root/config.json --unix-socket /run/control.unit.sock http://localhost/config/ && \
	rm /root/config.json

ENTRYPOINT ["unitd"]
CMD ["--no-daemon", "--control", "unix:/var/run/control.unit.sock"]