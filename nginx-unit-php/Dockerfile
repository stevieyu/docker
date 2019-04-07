FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

ENV UNIT_VERSION=1.8.0

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache php7-dev php7-embed curl alpine-sdk \

	php7-json php7-phar php7-zlib php7-openssl php7-curl php7-pdo php7-mbstring php7-fileinfo \
	php7-intl php7-exif php7-xmlwriter php7-simplexml \
    php7-tokenizer php7-dom php7-xml php7-opcache php7-session php7-gd \
    php7-ctype php7-mcrypt php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-mysqlnd php7-pear && \
    
    curl -L https://unit.nginx.org/download/unit-$UNIT_VERSION.tar.gz -o unit.tar.gz && \
    tar -xzvf unit.tar.gz && mv unit-$UNIT_VERSION unit && \
    cd unit && \
    ./configure \
		--prefix="/usr" \
		--state="/var/lib/unit" \
		--control="unix:/run/control.unit.sock" \
		--pid="/run/unit.pid" \
		--log="/var/log/unit.log" \
		--modules="/usr/lib/unit/modules" && \
	./configure php --module=php7 --config=php-config7 && \
	make all && \
	make install && \
	cd .. && rm -rf unit* && apk del alpine-sdk php7-dev

VOLUME /root/www

ENTRYPOINT ["unitd"]
CMD ["--no-daemon", "--control", "unix:/var/run/control.unit.sock"]