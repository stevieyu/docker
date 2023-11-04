FROM scratch
# ADD http://sgp.kodo.stevie.top/dl.openwrt.ai/releases/targets/x86/64/openwrt-10.15.2023-x86-64-generic-rootfs.tar.gz /
ADD openwrt-10.15.2023-x86-64-generic-rootfs.tar.gz /

# RUN sed -i 's_downloads.openwrt.org_mirrors.aliyun.com/openwrt_' /etc/opkg/distfeeds.conf

EXPOSE 80

CMD ["/sbin/init"]
