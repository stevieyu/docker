FROM       alpine:edge
MAINTAINER Stevie "https://github.com/yzm629"

ENV COW_INSTALLDIR="/root"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update && \
    apk add curl && \
    curl -L git.io/cow | sh

WORKDIR /root/.cow/
RUN mv rc rc.bak && \
    echo 'listen = http://0.0.0.0:7777' >> rc && \
    echo 'loadBalance = latency' >> rc && \
    echo 'alwaysProxy = true' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-1.xt.lianjiang.moe:1152' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-2.xt.lianjiang.moe:1152' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-3.xt.lianjiang.moe:1152' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-4.xt.lianjiang.moe:1152' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-5.xt.lianjiang.moe:1152' >> rc && \
    echo 'proxy = ss://rc4-md5:MxPgc7p5@hk-6.xt.lianjiang.moe:1152' >> rc

EXPOSE 7777

CMD ["/root/cow"]
