FROM alpine:edge
MAINTAINER Stevie yzm629@gmail.com

ENV COMPOSER_ALLOW_SUPERUSER 1

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/edge/testing >> /etc/apk/repositories && \
    \
    apk add --no-cache --virtual .build-deps curl && \
    apk add --no-cache git \
    php7 php7-dev php7-fpm php7-json php7-phar php7-zlib php7-openssl php7-curl php7-pdo php7-mbstring php7-fileinfo \
    php7-intl php7-exif php7-iconv php7-tokenizer php7-opcache php7-session php7-gd php7-zip \
    php7-xmlwriter php7-simplexml php7-xmlreader php7-pcntl php7-posix \
    php7-ctype php7-mcrypt php7-bcmath php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-mysqlnd php7-pear \
    php7-pecl-redis php7-pecl-swoole php7-pecl-inotify && \
    php --ini && \
    echo "swoole.use_shortname = off" >> /etc/php7/conf.d/50_swoole.ini && \
    sed -i 's/127.0.0.1:9000/9000/g' /etc/php7/php-fpm.d/www.conf && \
    ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm && \
    \
    curl -k https://getcomposer.org/composer.phar -o /usr/local/bin/composer && \
    chmod a+x /usr/local/bin/composer && \
    composer config -g secure-http false && \
    composer config -g --auth github-oauth.github.com a4b2307846304c5b2eceb2dc3b75bbdd19476421 && \
    composer config -g repositories.packagist composer https://mirrors.aliyun.com/composer/ && \
    \
    apk add --no-cache nodejs-current nodejs-npm && \
    curl -k -o ~/.npmrc https://cdn.jsdelivr.net/gh/stevieyu/stevieyu.github.io/.npmrc && \
    \
    apk add --no-cache libc6-compat && \
    ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2 && \
    \
    apk del -f .build-deps && \
    mkdir -p /www && \
    chown -R nobody:nobody /www

WORKDIR /www

EXPOSE 9000

CMD ["php", "-a"]
#CMD ["php-fpm", "-F"]