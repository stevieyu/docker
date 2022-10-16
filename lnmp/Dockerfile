FROM ubuntu

RUN sed -i -E 's/(archive|security).ubuntu.com/mirrors.cloud.tencent.com/g' /etc/apt/sources.list && \
    apt update && \
    apt install -y aria2 wget

# https://github.com/oneinstack/lnmp
RUN aria2c -x 4 http://mirrors.linuxeye.com/oneinstack-full.tar.gz && \
    tar xzf oneinstack-full.tar.gz && \
    rm oneinstack-full.tar.gz

# https://oneinstack.com/auto/
RUN /oneinstack/install.sh \
    --nginx_option 1 --php_option 11 --phpcache_option 1 --php_extensions imagick --db_option 1 --dbinstallmethod 1 --dbrootpwd admin

