FROM       alpine:latest
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache nodejs nodejs-npm git python py2-pip make g++ vim curl pkgconfig python-dev yaml-dev libpq libjpeg libxslt-dev libffi-dev postgresql postgresql-dev && \
    pip install -U virtualenv && \
    virtualenv /www/sentry/ && \
    source /www/sentry/bin/activate && \
    pip install -U sentry

CMD ["sh"]