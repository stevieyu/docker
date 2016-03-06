FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
RUN apk --update add curl php-cli php-json php-phar php-openssl nodejs gcc make python

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer config -g github-oauth.github.com 8772343e8343b3dfdcf77f57c27bc0bd4f08550f && \
    composer config -g repositories.packagist composer http://packagist.phpcomposer.com

RUN npm config set registry https://registry.npm.taobao.org && \
    npm install -g node-gyp --registry=https://registry.npm.taobao.org

CMD ["php", "-a"]