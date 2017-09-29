FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
#RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
# RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y openssh-server zsh git

#ssh 配置
RUN mkdir /var/run/sshd && \
    echo "root:'" |chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#zsh 配置
RUN git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

# RUN mkdir /root/data
# VOLUME ["/root/data"]

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
