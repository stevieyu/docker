FROM       alpine:edge
MAINTAINER Stevie yzm629@gmail.com

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    echo http://mirrors.aliyun.com/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache axel git vim \
    php7 php7-json php7-phar php7-zlib php7-openssl php7-curl php7-pdo php7-mbstring php7-fileinfo php7-tokenizer php7-dom php7-xml php7-opcache php7-session php7-gd \
    php7-ctype php7-mcrypt php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-mysqlnd && \
    php --ini && \

    axel https://getcomposer.org/composer.phar && \
    mv composer.phar /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer config -g secure-http false && \
    composer config -g github-oauth.github.com 8772343e8343b3dfdcf77f57c27bc0bd4f08550f && \
    composer config -g repositories.packagist composer https://packagist.phpcomposer.com

RUN apk add --no-cache apache2 php7-apache2 apache2-http2 apache2-ssl && \
    mkdir /run/apache2

RUN apk add --no-cache mariadb mariadb-client && \
    mkdir /run/mysqld && \
    mysql_install_db --user=root > /dev/null

WORKDIR /root

EXPOSE 80 443 3389
#/var/www/localhost/htdocs

#CMD ["php", "-a"]
#CMD ["httpd", "-D", "FOREGROUND"]
#CMD ["mysqld", "--user=root"]"
CMD ["httpd", "-D", "FOREGROUND"]