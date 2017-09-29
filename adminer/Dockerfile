FROM       alpine:edge
MAINTAINER Stevie "https://github.com/yzm629"

#docker run -d -p 3306:3306 -e MYSQL_ROOT_PASSWORD=root --name mysql mysql
#docker run -d -p 8888:80 --link mysql:mysql adminer

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    echo http://mirrors.ustc.edu.cn/alpine/edge/testing >> /etc/apk/repositories && \
    apk update && \
    apk add wget php7 \
    php7-mysqli php7-pgsql && \
    mkdir /var/www && \
    wget http://www.adminer.org/latest.php -O /var/www/index.php

WORKDIR /var/www

EXPOSE 80

CMD ["php", "-S", "0.0.0.0:80"]
