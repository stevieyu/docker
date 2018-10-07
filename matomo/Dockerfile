FROM       alpine:latest
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache curl unzip \
    php7 php7-curl php7-gd php7-xml php7-mbstring php7-iconv php7-pdo php7-pdo_mysql php7-mysqli php7-mcrypt \
    php7-json php7-phar php7-zlib php7-openssl php7-tokenizer php7-dom php7-opcache php7-session php7-ctype php7-simplexml && \
    php --ini && \
#mysqld_safe --user=root&
    apk add --no-cache mysql mysql-client && \
    mkdir /run/mysqld && \
    mysql_install_db --user=root > /dev/null && \
#
	curl -O https://builds.matomo.org/piwik.zip && \
	unzip piwik.zip && rm piwik.zip

COPY start.sh .
RUN chmod +x start.sh

EXPOSE 80

ENTRYPOINT ["/root/start.sh"]