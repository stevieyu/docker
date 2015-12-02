FROM       ubuntu:15.10
MAINTAINER Stevie "https://github.com/yzm629"

#更换为网易镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list && \
    apt-get update

#安装&更新
RUN apt-get install -y wget

#LAMP 安装
RUN wget https://bitnami.com/redirect/to/82871/bitnami-lampstack-7.0.0RC8-0-dev-linux-x64-installer.run
RUN chmod 777 bitnami-lampstack-7.0.0RC8-0-dev-linux-x64-installer.run && \
    ./bitnami-lampstack-7.0.0RC8-0-dev-linux-x64-installer.run --installer-language zh_CN --mode unattended --base_password 666666 --prefix /opt/lamp && \
    rm bitnami-lampstack-7.0.0RC8-0-dev-linux-x64-installer.run
#phpmyadmin开启外网访问
RUN sed -i "s/Require local/Require all granted/" /opt/lamp/apps/phpmyadmin/conf/httpd-app.conf
#mysql开启外网访问
RUN sed -i "s/bind-address=127.0.0.1/#bind-address=127.0.0.1/" /opt/lamp/mysql/my.cnf
#安装文件管理
RUN rm -rf /opt/lamp/apache2/htdocs && \
    git clone https://github.com/magento/magento2.git /opt/lamp/apache2/htdocs/ && \
    chmod -R 777 /opt/lamp/apache2/htdocs
#添加软链接
RUN ln -s /opt/lnmp/apache2/htdocs /root/htdocs

EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["/usr/sbin/sshd", "-D"]
