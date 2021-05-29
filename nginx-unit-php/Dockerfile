FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

ENV UNIT_VERSION=1.24.0

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache curl php7-embed \
	php7-json php7-phar php7-zlib php7-openssl php7-curl php7-pdo php7-mbstring php7-fileinfo \
    php7-intl php7-exif php7-iconv php7-tokenizer php7-opcache php7-session php7-gd php7-zip \
    php7-xmlwriter php7-simplexml php7-xmlreader php7-pcntl php7-posix \
    php7-ctype php7-mcrypt php7-bcmath php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-mysqlnd php7-pear \
    php7-pecl-redis && \
    # 安装编译依赖
    apk add --no-cache --virtual .build-deps alpine-sdk php7-dev axel && \
    axel -k https://unit.nginx.org/download/unit-$UNIT_VERSION.tar.gz -o unit.tar.gz && \
    tar -xzvf unit.tar.gz && mv unit-$UNIT_VERSION unit && \
    # 配置 & 编译
    cd unit && \
    ./configure \
		#--debug \
		--prefix="/usr" \
		--state="/var/lib/unit" \
		--control="unix:/run/control.unit.sock" \
		--pid="/run/unit.pid" \
		--log="/var/log/unit.log" \
		--modules="/usr/lib/unit/modules" && \
	./configure php --module=php7 --config=php-config7 && \
	make install && \
	cd .. && rm -rf unit* && \
	apk del .build-deps

	# 配置 demo 环境
COPY config.json /root/
COPY app /www/
WORKDIR /www
RUN unitd --control unix:/run/control.unit.sock && \
	curl -X PUT --data-binary @/root/config.json --unix-socket /run/control.unit.sock http://localhost/config/ && \
	#rm /root/config.json && \
	ln -sf /dev/stdout /var/log/unit.log

EXPOSE 8020

ENTRYPOINT ["unitd"]
CMD ["--no-daemon", "--user", "root","--control", "unix:/run/control.unit.sock"]