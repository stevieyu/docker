FROM       ubuntu:devel
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y supervisor openssh-server vim screen git curl wget axel unzip tmux && \

#ssh 配置
	mkdir /var/run/sshd && \
    echo "root:'" |chpasswd && \
    sed -ri 's/^PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

COPY supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]
