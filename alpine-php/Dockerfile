FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
RUN apk --update add curl php7 php7-mcrypt

RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

CMD ["php", "-a"]