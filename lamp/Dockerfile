FROM       ubuntu:16.04
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

#LAMP 安装
ENV LAMP_VERSION 7.0.2
RUN wget https://downloads.bitnami.com/files/stacks/lampstack/$LAMP_VERSION-0/bitnami-lampstack-$LAMP_VERSION-0-dev-linux-x64-installer.run
RUN chmod 777 bitnami-lampstack-$LAMP_VERSION-0-dev-linux-x64-installer.run && \
    ./bitnami-lampstack-$LAMP_VERSION-0-dev-linux-x64-installer.run --mode unattended --base_password 666666 --prefix /opt/lamp && \
    rm bitnami-lampstack-$LAMP_VERSION-0-dev-linux-x64-installer.run
#phpmyadmin开启外网访问
RUN sed -i "s/Require local/Require all granted/" /opt/lamp/apps/phpmyadmin/conf/httpd-app.conf
#mysql开启外网访问
RUN sed -i "s/bind-address=127.0.0.1/#bind-address=127.0.0.1/" /opt/lamp/mysql/my.cnf
#安装文件管理
RUN rm -rf /opt/lamp/apache2/htdocs/* && \
    wget https://github.com/kalcaddle/KODExplorer/archive/master.zip && unzip master.zip && rm master.zip && \
    mv KODExplorer-master /opt/lamp/apache2/htdocs/k && \
    chmod -R 777 /opt/lamp/apache2/htdocs
#添加软链接
RUN ln -s /opt/lamp/apache2/htdocs /root/htdocs

VOLUME ["/root/htdocs"]

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["/usr/sbin/sshd", "-D"]
