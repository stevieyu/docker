FROM       alpine:edge
MAINTAINER Stevie "https://github.com/yzm629"
# https://github.com/fatedier/frp
WORKDIR /root/

ENV COW_INSTALLDIR="/root"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
	&& apk update
    #&& apk add tar \
    #&& curl -L https://github.com/fatedier/frp/releases/download/v0.20.0/frp_0.20.0_linux_amd64.tar.gz

COPY cow-linux64-0.9.8 cow

RUN chmod 777 cow && \
	mkdir .cow

WORKDIR /root/.cow/

RUN echo 'listen = http://0.0.0.0:8080' >> rc && \
    echo 'loadBalance = latency' >> rc
    #echo 'alwaysProxy = true' >> rc && \
    #echo 'proxy = ss://aes-128-cfb:miaomiao@hk-3.mitsuha-node.com:543' >> rc
    #echo 'proxy = socks5://172.17.0.1:9991' >> rc

EXPOSE 8080

CMD ["/root/cow"]
