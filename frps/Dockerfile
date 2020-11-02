FROM alpine:latest
MAINTAINER yzm629@gmail.com

#https://github.com/fatedier/frp/blob/master/README_zh.md

ENV frps_version=0.25.3 \
    frps_DIR=/usr/local/frps

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    frps_latest_filename=frp_${frps_version}_linux_amd64.tar.gz && \
    apk add --no-cache  --virtual TMP axel tar && \
    [ ! -d ${frps_DIR} ] && mkdir -p ${frps_DIR} && cd ${frps_DIR} && \
    axel https://github.com/fatedier/frp/releases/download/v${frps_version}/frp_${frps_version}_linux_amd64.tar.gz && \
    tar xzf ${frps_latest_filename} && \
    mv frp_${frps_version}_linux_amd64/frps ${frps_DIR}/frps && \
    apk --no-cache del --virtual TMP && \
    rm -rf /var/cache/apk/* ~/.cache ${frps_DIR}/${frps_latest_filename} ${frps_DIR}/frp_${frps_version}_linux_amd64

VOLUME /conf

ENTRYPOINT ["/usr/local/frps/frps", "-c", "/conf/frps.ini"]