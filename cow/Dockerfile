FROM       alpine:edge
MAINTAINER Stevie "https://github.com/yzm629"

ENV COW_INSTALLDIR="/root"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk update && \
    apk add curl && \
    curl -L https://raw.githubusercontent.com/cyfdecyf/cow/master/install-cow.sh | sh

WORKDIR /root/.cow/
RUN mv rc rc.bak && \
    echo 'listen = http://0.0.0.0:7777' >> rc && \
    echo 'loadBalance = latency' >> rc && \
    echo 'alwaysProxy = true' >> rc && \
    echo 'proxy = ss://chacha20:JgCGuv@hk-1.mitsuha-node.com:27457' >> rc && \
    echo 'proxy = ss://chacha20:JgCGuv@hk-2.mitsuha-node.com:27457' >> rc && \
    echo 'proxy = ss://chacha20:JgCGuv@hk-3.mitsuha-node.com:27457' >> rc && \
    echo 'proxy = ss://chacha20:JgCGuv@hk-4.mitsuha-node.com:27457' >> rc && \
    echo 'proxy = ss://chacha20:JgCGuv@hk-5.mitsuha-node.com:27457' >> rc && \
    echo 'proxy = ss://chacha20:JgCGuv@hk-6.mitsuha-node.com:27457' >> rc

EXPOSE 7777

CMD ["/root/cow"]
