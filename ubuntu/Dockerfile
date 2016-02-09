FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#代理设置
#ENV http_proxy http://120.198.231.86:8080
#ENV https_proxy http://119.105.177.105:8118
#ENV https_proxy ""

#更换镜像
#RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list
#RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y openssh-server vim zsh screen git curl wget

#ssh 配置
RUN mkdir /var/run/sshd && \
    echo "root:'" |chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#zsh 配置
RUN git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh && \
    cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

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
