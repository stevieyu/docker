FROM alpine:latest

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache aria2 

VOLUME /root/downloads

EXPOSE 6800

ENTRYPOINT ["aria2c"]
CMD ["--enable-rpc", "--rpc-listen-all", "--dir=/root/downloads", "--continue=true", "--max-connection-per-server=16", "--min-split-size=1M", "--split=10"]