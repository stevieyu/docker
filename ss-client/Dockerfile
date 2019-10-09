FROM shadowsocks/shadowsocks-libev
MAINTAINER Stevie yzm629@gmail.com

USER root

ENV PRIVOXY_PORT=8118
ENV LOCAL_PORT=8110

WORKDIR /root
ADD run.sh .

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache privoxy && \
    sed -i "s/127.0.0.1:8118/0.0.0.0:$PRIVOXY_PORT/g" /etc/privoxy/config && \
    sed -i 's/enable-edit-actions\ 0/enable-edit-actions\ 1/g' /etc/privoxy/config && \
    sed -i 's/accept-intercepted-requests\ 0/accept-intercepted-requests\ 1/g' /etc/privoxy/config && \
    #echo "forward-socks5 / 127.0.0.1:$LOCAL_PORT ." >>/etc/privoxy/config && \
    # 开启代理地址判断，只有国外地址才翻墙
    apk add --no-cache --virtual .g2p-deps curl perl bash && \
    curl -4sSkLO https://raw.github.com/zfl9/gfwlist2privoxy/master/gfwlist2privoxy && \
    bash gfwlist2privoxy "127.0.0.1:$LOCAL_PORT" && \
    mv -f gfwlist.action /etc/privoxy && \
    echo 'actionsfile gfwlist.action' >>/etc/privoxy/config && \
    apk del .g2p-deps && \
    # 结束
    rm -rf /tmp/* && \
    chmod +x run.sh

#ENTRYPOINT []
CMD ["/root/run.sh"]