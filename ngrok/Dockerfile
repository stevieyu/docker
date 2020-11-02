FROM ubuntu:16.10
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list

ENV NGROK_DOMAIN="xxxx.com"

#安装&更新
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y build-essential golang mercurial git && \
    git clone https://github.com/yzm629/ngrok.git && \
    cd ngrok && \
    openssl genrsa -out base.key 2048 && \
    openssl req -new -x509 -nodes -key base.key -days 10000 -subj "/CN=$NGROK_DOMAIN" -out base.pem && \
    openssl genrsa -out server.key 2048 && \
    openssl req -new -key server.key -subj "/CN=$NGROK_DOMAIN" -out server.csr && \
    openssl x509 -req -in server.csr -CA base.pem -CAkey base.key -CAcreateserial -days 10000 -out server.crt && \
    cp base.pem assets/client/tls/ngrokroot.crt && \
    make release-server release-client

EXPOSE 80
EXPOSE 443
EXPOSE 4443
EXPOSE 19892
EXPOSE 19957

CMD ["bash"]
