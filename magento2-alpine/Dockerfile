FROM       alpine:latest
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache git vim \
    php7 php7-json php7-phar php7-zlib php7-openssl php7-curl php7-intl php7-pdo php7-mbstring php7-fileinfo php7-tokenizer php7-dom php7-xml php7-simplexml php7-xmlwriter php7-opcache php7-session \
    php7-gd php7-ctype php7-soap php7-xsl php7-iconv php7-zip php7-mcrypt php7-pdo_mysql php7-pdo_sqlite php7-mysqli php7-mysqlnd && \
    php --ini && \

    curl -k https://mirrors.aliyun.com/composer/composer.phar -o /usr/local/bin/composer && \
    chmod +x /usr/local/bin/composer && \
    composer config -g secure-http false && \
    composer config -g github-oauth.github.com de26cefe889daf1030c123578b162b5a651f08ba && \
    composer config -g repositories.packagist composer https://mirrors.aliyun.com/composer/

RUN apk add --no-cache apache2 php7-apache2 apache2-ssl && \
    mkdir /run/apache2 && \
    sed -i 's/#LoadModule rewrite_module/LoadModule rewrite_module/g' /etc/apache2/httpd.conf && \
    sed -i 's/#LoadModule deflate_module/LoadModule deflate_module/g' /etc/apache2/httpd.conf && \
    sed -i 's/AllowOverride None/AllowOverride All/g' /etc/apache2/httpd.conf

RUN apk add --no-cache mariadb mariadb-client && \
    mkdir /run/mysqld && \
    mysql_install_db --user=root > /dev/null

RUN apk add --no-cache nodejs nodejs-npm && \
    npm config set registry http://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=http://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs

# git clone --depth=1 -b 2.2 https://github.com/magento/magento2.git
# chmod -R 777 /var/www/localhost/htdocs/

WORKDIR /root

EXPOSE 80 443 3389
#/var/www/localhost/htdocs

#CMD ["php", "-a"]
#CMD ["httpd", "-D", "FOREGROUND"]
#CMD ["mysqld", "--user=root"]"
CMD ["httpd", "-D", "FOREGROUND"]