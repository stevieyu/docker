FROM alpine:edge
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
#--repository http://dl-3.alpinelinux.org/alpine/edge/testing/
RUN apk update && \ 
    apk add curl nodejs make python php-cli php-json php-phar php-openssl php-mysql php-sqlite3 php-mysqli php-pdo_mysql php-pdo_sqlite

RUN php --ini && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer config -g secure-http false && \
    composer config -g github-oauth.github.com 8772343e8343b3dfdcf77f57c27bc0bd4f08550f && \
    composer config -g repositories.packagist composer http://packagist.phpcomposer.com && \
    npm config set registry https://registry.npm.taobao.org && \
    npm install -g node-gyp gulp --registry=https://registry.npm.taobao.org

CMD ["php", "-a"]