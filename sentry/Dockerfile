FROM       alpine:edge
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

# https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache nodejs nodejs-npm git python py2-pip make g++ vim curl pkgconfig python-dev yaml-dev libpq libjpeg libxslt-dev libffi-dev postgresql postgresql-dev && \
    pip install -U virtualenv && \
    virtualenv /www/sentry/ && \
    source /www/sentry/bin/activate && \
    pip install -U sentry

CMD ["sh"]