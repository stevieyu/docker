FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
#echo http://mirrors.aliyun.com/alpine/edge/testing >> /etc/apk/repositories && \
#mirrors.ustc.edu.cn
#mirror.tuna.tsinghua.edu.cn
#mirrors.cug.edu.cn/
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache curl nodejs nodejs-npm make ruby python g++ git \

    php7 php7-dev php7-fpm php7-json php7-phar php7-zlib php7-openssl php7-curl php7-pdo php7-mbstring php7-fileinfo \
    php7-intl php7-exif php7-xmlwriter php7-simplexml \
    php7-tokenizer php7-dom php7-xml php7-opcache php7-session php7-gd \
    php7-ctype php7-mcrypt php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-mysqlnd php7-pear && \

    curl https://dl.laravel-china.org/composer.phar -o /usr/local/bin/composer && \
    chmod a+x /usr/local/bin/composer

RUN php --ini && \

    sed -i 's/127.0.0.1:9000/9000/g' /etc/php7/php-fpm.d/www.conf && \
    ln -s /usr/sbin/php-fpm7 /usr/sbin/php-fpm && \

    composer config -g secure-http false && \
    composer config -g github-oauth.github.com 8772343e8343b3dfdcf77f57c27bc0bd4f08550f && \
    composer config -g repositories.packagist composer https://packagist.laravel-china.org && \

    npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \

    mkdir -p /var/www/html && \
    chown -R nobody:nobody /var/www/html

WORKDIR /var/www/html

CMD ["php", "-a"]
#CMD ["php-fpm", "-F"]