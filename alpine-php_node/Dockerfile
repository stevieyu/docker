FROM alpine:edge
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
RUN apk --update \
    add curl nodejs make python php-cli php-json php-phar php-openssl

RUN php --ini && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer config -g github-oauth.github.com 8772343e8343b3dfdcf77f57c27bc0bd4f08550f && \
    composer config -g secure-http false && \
    composer config -g repositories.packagist composer http://packagist.phpcomposer.com && \
    npm config set registry https://registry.npm.taobao.org && \
    npm install -g node-gyp --registry=https://registry.npm.taobao.org

CMD ["php", "-a"]