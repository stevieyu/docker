FROM       ubuntu:15.10
MAINTAINER Stevie "https://github.com/yzm629"

#更换为网易镜像
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ./sources.list /etc/apt/sources.list

#安装&更新
RUN apt-get update
RUN apt-get install -y openssh-server vim zsh fish screen git curl wget unzip
RUN apt-get dist-upgrade -y

#ssh 配置
RUN mkdir /var/run/sshd
RUN echo "root:'" |chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#LAMP 安装
RUN wget https://bitnami.com/redirect/to/77750/bitnami-lampstack-7.0.0RC7-0-dev-linux-x64-installer.run
RUN chmod 777 bitnami-lampstack-7.0.0RC7-0-dev-linux-x64-installer.run
RUN ./bitnami-lampstack-7.0.0RC7-0-dev-linux-x64-installer.run --installer-language zh_CN --mode unattended --base_password 666666 --prefix /opt/lamp
RUN rm bitnami-lampstack-7.0.0RC7-0-dev-linux-x64-installer.run
#phpmyadmin开启外网访问
RUN sed -i "s/Require local/Require all granted/" /opt/lamp/apps/phpmyadmin/conf/httpd-app.conf
#mysql开启外网访问
RUN sed -i "s/bind-address=127.0.0.1/#bind-address=127.0.0.1/" /opt/lamp/mysql/my.cnf
#设置环境变量
RUN echo PATH="/opt/lamp/heroku/bin:/opt/lamp/ruby/bin:/opt/lamp/git/bin:/opt/lamp/varnish/bin:/opt/lamp/sqlite/bin:/opt/lamp/php/bin:/opt/lamp/mysql/bin:/opt/lamp/apache2/bin:/opt/lamp/common/bin:$PATH" >> ~/.bashrc
#安装文件管理
RUN git clone https://github.com/kalcaddle/KODExplorer.git /opt/lamp/apache2/htdocs/k
RUN chmod -R 777 /opt/lamp/apache2/htdocs

#zsh 配置
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
RUN cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

#RUN mkdir /root/data
#VOLUME ["/root/data"]

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["/usr/sbin/sshd", "-D"]