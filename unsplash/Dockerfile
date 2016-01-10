FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y openssh-server vim zsh fish screen git curl wget unzip make build-essential


#ssh 配置
RUN mkdir /var/run/sshd && \
    echo "root:'" |chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#zsh 配置
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

#nodejs
ENV NODE_VERSION 0.12.9
RUN wget https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.gz --no-check-certificate && \
    tar -vxf node-v$NODE_VERSION-linux-x64.tar.gz && \
    rm node-v$NODE_VERSION-linux-x64.tar.gz && \
    mv /node-v$NODE_VERSION-linux-x64 /opt/node && \
    ln -s /opt/node/bin/node /usr/local/bin/node && \
    ln -s /opt/node/bin/npm /usr/local/bin/npm && \
    sed -ri 's/games"/games:\/opt\/node\/bin"/g' /etc/environment && \
    echo 'source /etc/environment' >> /root/.bashrc

#nodejs tools
RUN npm config set registry https://registry.npm.taobao.org && \
    npm install -g node-gyp pm2 --registry=https://registry.npm.taobao.org

RUN git clone https://github.com/DMarby/unsplash-it.git /root/unsplash-it && \
    git clone https://github.com/DMarby/unsplash-downloader.git /root/unsplash-downloader && \
    apt-get install -y pkg-config lsb-release vnstat cron && \
    vnstat --dumpdb --xml && \
    curl -s https://raw.githubusercontent.com/lovell/sharp/master/preinstall.sh | bash -
#RUN mkdir /root/data
#VOLUME ["/root/data"]

EXPOSE 22
EXPOSE 80
EXPOSE 5000

CMD ["/usr/sbin/sshd", "-D"]
