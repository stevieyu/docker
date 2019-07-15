FROM alpine:edge
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/edge/testing >> /etc/apk/repositories && \
    \
    apk add --no-cache git \
    php7 php7-dev php7-fpm php7-json php7-phar php7-zlib php7-openssl php7-curl php7-pdo php7-mbstring php7-fileinfo \
    php7-intl php7-exif php7-iconv php7-tokenizer php7-opcache php7-session php7-gd php7-zip \
    php7-xmlwriter php7-simplexml php7-xmlreader \
    php7-ctype php7-mcrypt php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-mysqlnd php7-pear \
    php7-pecl-redis php7-pecl-swoole php7-pecl-inotify && \
    php --ini && \
    sed -i 's/127.0.0.1:9000/9000/g' /etc/php7/php-fpm.d/www.conf && \
    ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm && \
    \
    apk add --no-cache curl && \
    curl https://getcomposer.org/composer.phar -o /usr/local/bin/composer && \
    chmod a+x /usr/local/bin/composer && \
    composer config -g secure-http false && \
    composer config -g github-oauth.github.com 8772343e8343b3dfdcf77f57c27bc0bd4f08550f && \
    composer config -g repositories.packagist composer https://mirrors.aliyun.com/composer/ && \
    \
    apk add --no-cache nodejs nodejs-npm && \
    npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    \
    mkdir -p /www && \
    chown -R nobody:nobody /www

WORKDIR /www

EXPOSE 9000

CMD ["php", "-a"]
#CMD ["php-fpm", "-F"]