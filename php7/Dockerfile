FROM       ubuntu:15.10
MAINTAINER Stevie "https://github.com/yzm629"

#更换为网易镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list && \
    apt-get update

#安装&更新
RUN apt-get install -y openssh-server vim zsh fish screen git curl wget unzip

#ssh 配置
RUN mkdir /var/run/sshd && \
    echo "root:'" |chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#zsh 配置
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

#编译 php7
RUN wget https://github.com/php/php-src/archive/php-7.0.0.zip && unzip php-7.0.0.zip && rm php-7.0.0.zip && mv php-src-php-7.0.0 php7
#RUN git clone https://github.com/php/php-src.git && mv php-src php7

RUN apt-get -y install autoconf make automake libtool re2c flex bison libxml2-dev \
    libxslt1-dev zlib1g-dev libcurl4-openssl-dev \
    libmcrypt-dev \
    libjpeg-dev libpng++-dev libfreetype6-dev \
    pkg-config libssl-dev

RUN cd /php7 && \
    ./buildconf --force && \
    ./configure --prefix=/usr/local/php --with-config-file-path=/usr/local/php/etc --enable-fpm --with-fpm-user=www --with-fpm-group=www --with-mysqli=mysqlnd --with-pdo-mysql=mysqlnd \
    --with-libdir=lib64 --with-xsl --with-xmlrpc --enable-zip --disable-fileinfo --with-iconv-dir --with-zlib --with-libxml-dir=/usr --enable-xml --with-curl \
    --with-mhash --enable-bcmath --with-mcrypt --enable-mbstring --enable-sockets --enable-soap --without-pear --with-gettext \
    --with-freetype-dir --with-jpeg-dir --with-png-dir --with-gd --enable-gd-native-ttf \
    --with-openssl --disable-rpath --enable-shmop --enable-sysvsem --enable-inline-optimization --enable-mbregex --enable-ftp --with-mhash --enable-pcntl --enable-maintainer-zts --enable-intl && \
    make -j 4 && make install

RUN wget http://curl.haxx.se/ca/cacert.pem && \
    mv cacert.pem /usr/local/php/cacert.pem && \
    cp /php7/php.ini-* /usr/local/php/etc/ && \
    cp /usr/local/php/etc/php.ini-development /usr/local/php/etc/php.ini && \
    cp /usr/local/php/etc/php-fpm.conf.default /usr/local/php/etc/php-fpm.conf && \
    cp /usr/local/php/etc/php-fpm.d/www.conf.default /usr/local/php/etc/php-fpm.d/www.conf && \
    groupadd www && useradd -g www www

RUN sed -i 's/;openssl.cafile=/openssl.cafile=\/usr\/local\/php\/cacert.pem/g' /usr/local/php/etc/php.ini && \
    sed -i "s/;date.timezone =.*/date.timezone = UTC/" /usr/local/php/etc/php.ini && \
    sed -i "s/zlib.output_compression = Off/zlib.output_compression = On/" /usr/local/php/etc/php.ini && \
    sed -i "s/display_errors = Off/display_errors = stderr/" /usr/local/php/etc/php.ini && \
    sed -i "s/;zlib.output_compression_level = 1/zlib.output_compression_level = 5/" /usr/local/php/etc/php.ini && \
    sed -i "s/;opcache.enable=0/opcache.enable=0/" /usr/local/php/etc/php.ini

RUN ln -s /usr/local/php/bin/php /usr/local/bin/php && \
    ln -s /usr/local/php/bin/php-cgi /usr/local/bin/php-cgi && \
    ln -s /usr/local/php/sbin/php-fpm /usr/local/bin/php-fpm


#composer config -g repositories.packagist composer http://packagist.phpcomposer.com
#composer config -g repositories.packagist composer http://packagist.cn
RUN curl -sS https://getcomposer.org/installer | /usr/local/php/bin/php && \
    mv composer.phar /usr/local/bin/composer && \
    composer config -g github-oauth.github.com 8772343e8343b3dfdcf77f57c27bc0bd4f08550f && \
    composer config -g repositories.packagist composer http://packagist.phpcomposer.com

#RUN mkdir /root/data
#VOLUME ["/root/data"]

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["/usr/sbin/sshd", "-D"]
