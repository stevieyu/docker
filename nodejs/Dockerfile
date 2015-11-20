FROM       ubuntu:15.10
MAINTAINER Stevie "https://github.com/yzm629"

#更换为网易镜像
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY ./sources.list /etc/apt/sources.list

#安装&更新
RUN apt-get update
RUN apt-get install -y openssh-server vim zsh screen git curl wget unzip
#    build-essential g++ libkrb5-dev libfreetype6 libfontconfig
#    libjpeg8 libpng12-0 libicu-dev libcurl3 libcurl3-gnutls libcurl4-openssl-dev
#    libcurl3 libcurl3-gnutls libcurl4-openssl-dev
#RUN apt-get dist-upgrade -y

#ssh 配置
RUN mkdir /var/run/sshd
RUN echo "root:'" |chpasswd
RUN sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#nodejs
RUN curl -sL https://deb.nodesource.com/setup_5.x | bash -
RUN apt-get install -y nodejs

#nodejs tools
RUN npm install -g node-gyp gulp bower --registry=https://registry.npm.taobao.org

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