FROM       openwrtorg/rootfs:x86-64-21.02.1
MAINTAINER Stevie "https://github.com/yzm629"

RUN sed -i 's_downloads.openwrt.org_mirrors.aliyun.com/openwrt_' /etc/opkg/distfeeds.conf && \
    sed -i 's/option check/#option check/'  /etc/opkg.conf && \
    opkg update && \
    opkg install luci \
    && \
    /etc/init.d/uhttpd enable && \
    /etc/init.d/uhttpd start
