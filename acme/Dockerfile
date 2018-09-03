FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache curl openssl curl socat apk-cron \
    && curl https://get.acme.sh | sh

ENTRYPOINT ["~/.acme.sh/acme.sh"]
CMD ["--help"]