FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

ENV COW_INSTALLDIR="/root"

RUN sed -i 's/archive.ubuntu.com/cn.archive.ubuntu.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y curl && \
    curl -L git.io/cow | bash

WORKDIR /root/.cow/
RUN mv rc rc.bak && \
    echo 'listen = http://0.0.0.0:7777' >> rc && \
    echo 'loadBalance = latency' >> rc && \
    echo 'alwaysProxy = false' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-1.xt.lianjiang.moe:1152' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-2.xt.lianjiang.moe:1152' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-3.xt.lianjiang.moe:1152' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-4.xt.lianjiang.moe:1152' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-5.xt.lianjiang.moe:1152' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-6.xt.lianjiang.moe:1152' >> rc

EXPOSE 7777

CMD ["/root/cow"]
