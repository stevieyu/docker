FROM alpine:edge
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
#--repository http://dl-3.alpinelinux.org/alpine/edge/testing/
#--repository http://mirrors.ustc.edu.cn/alpine/edge/testing/
#mirrors.ustc.edu.cn
#mirror.tuna.tsinghua.edu.cn
#mirrors.cug.edu.cn/
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update && \
    apk add curl nodejs make ruby python \
    php7 php7-json php7-phar php7-zlib php7-openssl php7-curl php7-pdo php7-mbstring php7-tokenizer php7-dom php7-xml php7-opcache php7-session \
    php7-ctype php7-mcrypt

RUN php --ini && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer config -g secure-http false && \
    composer config -g github-oauth.github.com 8772343e8343b3dfdcf77f57c27bc0bd4f08550f && \
    composer config -g repositories.packagist composer https://packagist.phpcomposer.com && \
    npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm install -g node-gyp

CMD ["php", "-a"]