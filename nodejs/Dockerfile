FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
#RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

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
ENV NODE_VERSION 4.3.0
RUN wget http://oss.npm.taobao.org/dist/node/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz && \
    tar -vxf node-v$NODE_VERSION-linux-x64.tar.gz && \
    rm node-v$NODE_VERSION-linux-x64.tar.gz && \
    mv /node-v$NODE_VERSION-linux-x64 /opt/node && \
#    ln -s /opt/node/bin/node /usr/local/bin/node && \
#    ln -s /opt/node/bin/npm /usr/local/bin/npm && \
    sed -ri 's/games"/games:\/opt\/node\/bin"/g' /etc/environment && \
    echo 'source /etc/environment' >> /root/.bashrc

#nodejs tools
RUN /opt/node/bin/npm config set registry https://registry.npm.taobao.org && \
    /opt/node/bin/npm install -g node-gyp pm2 --registry=https://registry.npm.taobao.org

#清理操作
RUN apt-get autoclean && \
    apt-get clean && \
    apt-get autoremove && \
    deborphan | xargs apt-get -y remove --purge

#RUN mkdir /root/data
#VOLUME ["/root/data"]

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3000
EXPOSE 3306

CMD ["/usr/sbin/sshd", "-D"]
