FROM       ubuntu:latest
MAINTAINER Stevie "https://github.com/yzm629"

#更换镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \

#安装&更新
	apt-get update && \
    apt-get install -y curl lsb-release && \

#安装vestacp
	curl -O http://vestacp.com/pub/vst-install.sh && \
	bash vst-install.sh \
	--nginx yes --phpfpm yes --apache no --named no --remi no --vsftpd yes --proftpd no --iptables no --fail2ban no \
	--quota no --exim no --dovecot no --spamassassin no --clamav no --mysql yes --postgresql no && \

#清理操作
	apt-get autoclean && \
    apt-get clean && \
    apt-get autoremove && \
    deborphan | xargs apt-get -y remove --purge

EXPOSE 8083
EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["bash"]
