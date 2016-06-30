FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list

ENV NGROK_DOMAIN="xxxx.com"

#安装&更新
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y build-essential golang mercurial git && \
    git clone https://github.com/tutumcloud/ngrok.git && \
    cd ngrok

EXPOSE 80
EXPOSE 443
EXPOSE 4443
EXPOSE 19892
EXPOSE 19957

CMD ["/usr/sbin/sshd", "-D"]
