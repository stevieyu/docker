FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换为阿里云镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y openssh-server vim zsh fish screen git curl wget unzip

#ssh 配置
RUN mkdir /var/run/sshd && \
    echo "root:'" |chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#zsh 配置
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

#LNMP 安装
ENV LNMP_VERSION 1.9.9
RUN wget https://downloads.bitnami.com/files/stacks/nginxstack/$LNMP_VERSION-0/bitnami-nginxstack-$LNMP_VERSION-0-linux-x64-installer.run && \
    chmod 777 bitnami-nginxstack-$LNMP_VERSION-0-linux-x64-installer.run && \
    ./bitnami-nginxstack-$LNMP_VERSION-0-linux-x64-installer.run --mode unattended --base_password 666666 --prefix /opt/lnmp && \
    rm bitnami-nginxstack-$LNMP_VERSION-0-linux-x64-installer.run
#phpmyadmin开启外网访问
RUN sed -i "s/allow 127.0.0.1;/#allow 127.0.0.1;/" /opt/lnmp/apps/phpmyadmin/conf/nginx-app.conf && \
    sed -i "s/deny all;/#deny all;/" /opt/lnmp/apps/phpmyadmin/conf/nginx-app.conf
#mysql开启外网访问
RUN sed -i "s/bind-address=127.0.0.1/#bind-address=127.0.0.1/" /opt/lnmp/mysql/my.cnf
#添加软链接
RUN ln -s /opt/lnmp/nginx/html /root/html

#RUN mkdir /root/data
#VOLUME ["/root/data"]

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["/usr/sbin/sshd", "-D"]
