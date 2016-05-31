FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list
#RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y vim git curl wget

#nodejs
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs make build-essential  && \
    npm install -g node-gyp gulp --registry=https://registry.npm.taobao.org

#php
RUN apt-get install -y \
    php7.0-cli \
    php7.0-curl \
    php7.0-gd \
    php7.0-imap \
    php7.0-json \
    php7.0-ldap \
    php7.0-mcrypt \
    php7.0-zip \
    php7.0-bz2 \
    php7.0-mbstring \
    php7.0-xsl \
    php7.0-mysql \
    php7.0-sqlite3 \
    php7.0-xmlrpc


#phpunit
RUN wget https://phar.phpunit.de/phpunit.phar && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /usr/local/bin/phpunit

#composer
RUN curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    composer config -g github-oauth.github.com 8772343e8343b3dfdcf77f57c27bc0bd4f08550f && \
    composer config -g repo.packagist composer https://packagist.phpcomposer.com

#RUN mkdir /root/data
#VOLUME ["/root/data"]

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["bash"]
