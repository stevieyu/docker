FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y wget make build-essential python

#nvm
#RUN curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.30.2/install.sh | bash
RUN wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash && \
    echo 'registry=https://registry.npm.taobao.org/' >> /root/.npmrc

EXPOSE 22
EXPOSE 80
EXPOSE 443
EXPOSE 3000
EXPOSE 3306

CMD ["nvm"]
