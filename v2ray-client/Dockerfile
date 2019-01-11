FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache axel unzip \
    && axel -k -n 10 https://github.com/v2ray/v2ray-core/releases/download/v4.7.0/v2ray-linux-64.zip \
    && unzip v2ray-linux-64.zip -d v2ray \
    && cd v2ray \
    && chmod +x v2ray v2ctl

EXPOSE 1080

ENTRYPOINT ["v2ray"]
CMD ["-config=/root/v2ray/config.json"]