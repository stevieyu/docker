FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

ENV UNIT_VERSION=1.7

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache curl alpine-sdk nodejs nodejs-npm && \
    npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm i -g node-gyp && \
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
	./configure nodejs && \
	make all && \
	make install && \
	cd .. && rm -rf unit* && apk del alpine-sdk curl

VOLUME /var/www

ENTRYPOINT ["unitd"]
CMD ["--no-daemon", "--control", "unix:/var/run/control.unit.sock"]