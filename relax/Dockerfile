FROM       ubuntu:15.10
MAINTAINER Stevie "https://github.com/yzm629"

#更换为网易镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list

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

RUN curl -sL https://deb.nodesource.com/setup_4.x | bash -
RUN apt-get install -y cmake libvips pkg-config make gcc g++ clang python
#ENV http_proxy http://120.198.231.86:8080
ENV https_proxy http://119.105.177.105:8118

RUN apt-get install -y nodejs

ENV https_proxy ""

#nodejs
RUN curl -s https://raw.githubusercontent.com/lovell/sharp/master/preinstall.sh | bash -
RUN git clone https://github.com/relax/relax.git /root/relax
RUN npm config set registry https://registry.npm.taobao.org
RUN npm i -g node-gyp webpack
RUN cd /root/relax && npm i

#RUN mkdir /root/data
#VOLUME ["/root/data"]

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["/usr/sbin/sshd", "-D"]
