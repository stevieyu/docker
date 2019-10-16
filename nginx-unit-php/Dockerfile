FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

ENV UNIT_VERSION=1.12.0

WORKDIR /root
ADD config.json .
ADD index.php /www/index.php

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache php7-embed \
	php7-json php7-phar php7-zlib php7-openssl php7-curl php7-pdo php7-mbstring php7-fileinfo \
	php7-intl php7-exif php7-xmlwriter php7-simplexml \
    php7-tokenizer php7-dom php7-xml php7-opcache php7-session php7-gd \
    php7-ctype php7-mcrypt php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-mysqlnd php7-pear && \
    # 安装编译依赖
    apk add --no-cache --virtual .build-deps curl alpine-sdk php7-dev && \
    curl -L https://unit.nginx.org/download/unit-$UNIT_VERSION.tar.gz -o unit.tar.gz && \
    tar -xzvf unit.tar.gz && mv unit-$UNIT_VERSION unit && \
    # 配置 & 编译
    cd unit && \
    ./configure \
		--prefix="/usr" \
		--state="/var/lib/unit" \
		--control="unix:/run/control.unit.sock" \
		--pid="/run/unit.pid" \
		--log="/var/log/unit.log" \
		--modules="/usr/lib/unit/modules" && \
	./configure php --module=php7 --config=php-config7 && \
	make install && \
	cd .. && rm -rf unit* && \
	# 配置 demo 环境
	unitd --control unix:/var/run/control.unit.sock && \
	curl -X PUT --data-binary @/root/config.json --unix-socket /var/run/control.unit.sock http://localhost/config/ && \
	rm /root/config.json && \
	apk del .build-deps

VOLUME /www
WORKDIR /www

ENTRYPOINT ["unitd"]
CMD ["--no-daemon", "--control", "unix:/var/run/control.unit.sock"]