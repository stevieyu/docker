FROM       php:7-apache
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update && \

    #安装扩展
    apt-get install -y libxml2-dev libmcrypt4 libmcrypt-dev libxslt-dev libicu-dev libpng12-dev libjpeg-dev zlib1g-dev && \
    docker-php-ext-configure gd --with-jpeg-dir=/usr/lib && \
    docker-php-ext-install mbstring pdo_mysql soap mcrypt xsl intl gd zip && \

    #apache 功能启用
    a2enmod rewrite && \
    a2enmod headers && \
    a2enmod deflate && \

    cp /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/vhost.conf && \

    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer config -g github-oauth.github.com de26cefe889daf1030c123578b162b5a651f08ba && \
    composer config -g repositories.packagist composer https://mirrors.aliyun.com/composer/

RUN apt-get install -y wget unzip git && \
    wget https://github.com/magento/magento2/archive/2.2.0.zip && \
    unzip 2.2.0.zip && \
    rm 2.2.0.zip && \
    mv magento2-2.2.0 magento2 && \
    cd magento2 && \
    composer install && \
    chmod -R 777 magento2/var magento2/app/etc magento2/pub/media magento2/pub/static

CMD ["bash"]
