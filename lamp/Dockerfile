FROM       ubuntu:latest
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y vim git axel

#LAMP 安装
ENV LAMP_VERSION 7.1.12-0
ENV FILENAME bitnami-lampstack-$LAMP_VERSION-linux-x64-installer.run

RUN axel -n 50 https://downloads.bitnami.com/files/stacks/lampstack/$LAMP_VERSION/$FILENAME

RUN chmod 755 $FILENAME && \
    ./$FILENAME --mode unattended --base_password 666666 --prefix /opt/lamp && \
    rm $FILENAME

RUN echo PATH="/opt/lamp/git/bin:/opt/lamp/php/bin:/opt/lamp/mysql/bin:/opt/lamp/apache2/bin:/opt/lamp/common/bin:$PATH" >> /root/.bashrc && \

	/opt/lamp/php/bin/composer self-update && \
	/opt/lamp/php/bin/composer config -g secure-http false && \
    /opt/lamp/php/bin/composer config -g github-oauth.github.com de26cefe889daf1030c123578b162b5a651f08ba && \
    /opt/lamp/php/bin/composer config -g repositories.packagist composer https://mirrors.aliyun.com/composer/ && \

    #phpmyadmin开启外网访问
    sed -i "s/Require local/Require all granted/" /opt/lamp/apps/phpmyadmin/conf/httpd-app.conf && \

    #mysql开启外网访问
    sed -i "s/bind-address=127.0.0.1/#bind-address=127.0.0.1/" /opt/lamp/mysql/my.cnf && \
    chmod 777 -R /opt/lamp/mysql/* && \

    #添加软链接
    ln -s /opt/lamp/apache2/htdocs /root/htdocs

VOLUME /root/htdocs

WORKDIR /root/htdocs

EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["bash"]
