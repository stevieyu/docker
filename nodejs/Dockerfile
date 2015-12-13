FROM       ubuntu:15.10
MAINTAINER Stevie "https://github.com/yzm629"

#更换为网易镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list && \
    apt-get update

#安装&更新
RUN apt-get install -y openssh-server vim zsh fish screen git curl wget unzip make build-essential

#ssh 配置
RUN mkdir /var/run/sshd && \
    echo "root:'" |chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#zsh 配置
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

#nodejs
RUN wget https://nodejs.org/dist/v4.2.3/node-v4.2.3-linux-x64.tar.gz && \
    tar -vxf node-v4.2.3-linux-x64.tar.gz && \
    rm node-v4.2.3-linux-x64.tar.gz && \
    mv /node-v4.2.3-linux-x64 /opt/node && \
    ln -s /opt/node/bin/node /usr/local/bin/node && \
    ln -s /opt/node/bin/npm /usr/local/bin/npm

#nodejs tools
RUN npm config set registry https://registry.npm.taobao.org && \
    npm install -g node-gyp gulp bower jspm ied webpack pm2 --registry=https://registry.npm.taobao.org

#RUN mkdir /root/data
#VOLUME ["/root/data"]

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["/usr/sbin/sshd", "-D"]
