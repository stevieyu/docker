FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache axel \
    && axel https://github.com/txthinking/brook/releases/download/v20190601/brook \
    && chmod +x brook

ENTRYPOINT ["/root/brook"]
CMD ["--help"]