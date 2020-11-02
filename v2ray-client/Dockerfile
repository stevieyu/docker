FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache --virtual .build-deps wget unzip && \
    wget -k http://oss-hk.stevie.top/v2ray/v2ray-core/releases/download/v4.27.0/v2ray-linux-64.zip && \
    unzip v2ray-linux-64.zip -d v2ray && \
    rm *.zip && \
    apk del .build-deps && \
    mkdir /var/log/v2ray

EXPOSE 1080

CMD ["/root/v2ray/v2ray", "-config=/root/v2ray/config.json"]