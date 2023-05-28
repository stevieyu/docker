FROM alpine:latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache curl openssl curl socat apk-cron \
    && curl https://get.acme.sh | sh

ENTRYPOINT ["/root/.acme.sh/acme.sh"]
CMD ["--help"]