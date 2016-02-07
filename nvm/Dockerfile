FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
# RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y openssh-server vim zsh screen git curl wget make build-essential

#ssh 配置
RUN mkdir /var/run/sshd && \
    echo "root:'" |chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#zsh 配置
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

#nodejs
ENV NODE_VERSION 4.2.4
RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash

#RUN mkdir /root/data
#VOLUME ["/root/data"]

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3000
EXPOSE 3306

CMD ["/usr/sbin/sshd", "-D"]
