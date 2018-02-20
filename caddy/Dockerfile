FROM       alpine:edge
MAINTAINER Stevie "https://github.com/yzm629"

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/edge/testing >> /etc/apk/repositories && \
    apk --no-cache add tini

ADD ./caddy /usr/bin/caddy

EXPOSE 80 443 2015

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]