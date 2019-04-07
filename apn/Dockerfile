FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
#echo http://mirrors.aliyun.com/alpine/edge/testing >> /etc/apk/repositories && \
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    \
    apk add --no-cache \
    php7 php7-dev php7-fpm php7-json php7-phar php7-zlib php7-openssl php7-curl php7-pdo php7-mbstring php7-fileinfo \
    php7-intl php7-exif php7-iconv php7-tokenizer php7-opcache php7-session php7-gd php7-zip \
    php7-xmlwriter php7-simplexml php7-xmlreader \
    php7-pecl-memcached php7-pecl-redis php7-pecl-igbinary php7-pecl-mongodb php7-pecl-yaml php7-pecl-imagick php7-pecl-apcu php7-pecl-event \
    php7-ctype php7-mcrypt php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-mysqlnd php7-pear && \
    php --ini && \
    sed -i 's/127.0.0.1:9000/9000/g' /etc/php7/php-fpm.d/www.conf && \
    ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm && \
    \
    apk add --no-cache curl && \
    curl https://dl.laravel-china.org/composer.phar -o /usr/local/bin/composer && \
    chmod a+x /usr/local/bin/composer && \
    composer config -g secure-http false && \
    composer config -g github-oauth.github.com 8772343e8343b3dfdcf77f57c27bc0bd4f08550f && \
    composer config -g repositories.packagist composer https://packagist.laravel-china.org && \
    \
    apk add --no-cache nodejs nodejs-npm && \
    npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    \
    mkdir -p /www && \
    chown -R nobody:nobody /www && \
    \
    \
    apk add --no-cache alpine-sdk nghttp2-dev openssl-dev hiredis-dev && \
    cd /root && \
    curl -o /tmp/swoole-releases https://github.com/swoole/swoole-src/releases -L && \
    cat /tmp/swoole-releases | grep 'href=".*archive.*.tar.gz"' | head -1 | \
    awk -F '"' ' {print "curl -o /tmp/swoole.tar.gz https://github.com"$2" -L" > "/tmp/swoole.download"}' && \
    sh /tmp/swoole.download && \
    tar zxvf /tmp/swoole.tar.gz && cd swoole-src* && \
    phpize && \
    ./configure \
    --enable-coroutine \
    --enable-openssl  \
    --enable-http2  \
    --enable-async-redis \
    --enable-mysqlnd && \
    make && make install && \
    echo "extension=swoole.so" >> swoole.ini && \
    echo "swoole.fast_serialize=On" >> swoole.ini && \
    rm -rf /tmp/* /root/swoole-* && \
    apk del alpine-sdk nghttp2-dev openssl-dev hiredis-dev

WORKDIR /www

EXPOSE 9000

CMD ["php", "-a"]
#CMD ["php-fpm", "-F"]