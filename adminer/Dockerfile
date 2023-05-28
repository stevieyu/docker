FROM       alpine:latest
MAINTAINER Stevie "https://github.com/yzm629"

#docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name mysql mysql
#docker run -d -p 8888:80 --link mysql:mysql adminer

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.cloud.tencent.com/g' /etc/apk/repositories && \
    apk add --no-cache php8 \
    php8-mysqli php8-pgsql

ADD http://www.adminer.org/latest.php /www/

WORKDIR /www

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80"]
