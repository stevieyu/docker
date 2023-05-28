FROM alpine:latest

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache alpine-sdk bash curl zlib-dev util-linux-dev libmnl-dev gcc make git autoconf automake pkgconfig python logrotate \
    nodejs openrc && \

    git clone https://github.com/netdata/netdata.git --depth=1 && \
    cd netdata && \
    ./netdata-installer.sh --dont-wait && \

    echo -e "#!/usr/bin/env bash\n/usr/sbin/netdata" >/etc/local.d/netdata.start && \
    chmod 755 /etc/local.d/netdata.start && \
    echo -e "#!/usr/bin/env bash\nkillall netdata" >/etc/local.d/netdata.stop && \
    chmod 755 /etc/local.d/netdata.stop && \
    rc-update add local

EXPOSE 19999

#CMD ["php", "-a"]
#CMD ["php-fpm", "-F"]