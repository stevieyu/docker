FROM       ubuntu:latest
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y vim git axel

#LNMP 安装
ENV LNMP_VERSION 1.12.2-2
ENV FILENAME bitnami-nginxstack-$LNMP_VERSION-linux-x64-installer.run

RUN axel -n 50 https://downloads.bitnami.com/files/stacks/nginxstack/$LNMP_VERSION/$FILENAME

RUN chmod 755 $FILENAME && \
    ./$FILENAME --mode unattended --base_password 666666 --prefix /opt/lnmp && \
    rm $FILENAME

RUN echo PATH="/opt/lnmp/git/bin:/opt/lnmp/php/bin:/opt/lnmp/mysql/bin:/opt/lnmp/common/bin:$PATH" >> /root/.bashrc && \

    /opt/lnmp/php/bin/composer self-update && \
    /opt/lnmp/php/bin/composer config -g secure-http false && \
    /opt/lnmp/php/bin/composer config -g github-oauth.github.com de26cefe889daf1030c123578b162b5a651f08ba && \
    /opt/lnmp/php/bin/composer config -g repositories.packagist composer https://mirrors.aliyun.com/composer/ && \

    #phpmyadmin开启外网访问
    sed -i "s/allow 127.0.0.1;/#allow 127.0.0.1;/" /opt/lnmp/apps/phpmyadmin/conf/nginx-app.conf && \
    sed -i "s/deny all;/#deny all;/" /opt/lnmp/apps/phpmyadmin/conf/nginx-app.conf && \

    #mysql开启外网访问
    sed -i "s/bind-address=127.0.0.1/#bind-address=127.0.0.1/" /opt/lnmp/mysql/my.cnf && \
    chmod 777 -R /opt/lnmp/mysql/* && \

    #添加软链接
    ln -s /opt/lnmp/nginx/html /root/html

#RUN mkdir /root/data
VOLUME /root/html

WORKDIR /root/html

EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["bash"]
