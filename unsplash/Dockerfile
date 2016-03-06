FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
#RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y openssh-server vim zsh screen git curl wget make build-essential apt-transport-https lsb-release


#ssh 配置
RUN mkdir /var/run/sshd && \
    echo "root:'" |chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#zsh 配置
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

#nodejs
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    echo 'deb https://deb.nodesource.com/node_0.12 wily main' > /etc/apt/sources.list.d/nodesource.list && \
    apt-get update && apt-get install -y nodejs python make

#nodejs tools
RUN npm config set registry https://registry.npm.taobao.org && \
    npm install -g node-gyp pm2 --registry=https://registry.npm.taobao.org

RUN apt-get install -y pkg-config vnstat && \
    curl -s https://raw.githubusercontent.com/lovell/sharp/master/preinstall.sh | bash -

RUN git clone https://github.com/DMarby/unsplash-it.git /root/unsplash-it && \
    git clone https://github.com/DMarby/unsplash-downloader.git /root/unsplash-downloader && \
    vnstat --create -i eth0 && vnstat --dumpdb --xml

#RUN mkdir /root/data
#VOLUME ["/root/data"]

EXPOSE 22
EXPOSE 80
EXPOSE 5000

CMD ["/usr/sbin/sshd", "-D"]
