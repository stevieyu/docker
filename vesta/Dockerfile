FROM       ubuntu:16.04
MAINTAINER Stevie "https://github.com/yzm629"

#https://github.com/serghey-rodin/vesta
WORKDIR /root

RUN sed -i -E 's/(archive|security).ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list && \
	apt-get update && \
    apt-get install -y curl lsb-release && \
	curl -O http://vestacp.com/pub/vst-install.sh && \
	bash vst-install.sh --interactive no --lang cn --nginx yes --phpfpm yes --apache no --named no --remi no --vsftpd yes --proftpd no --iptables no --fail2ban no --quota no --exim no --dovecot no --spamassassin no --clamav no --softaculous no --mysql yes --postgresql no --hostname 0.0.0.0 --email admin@admin.cn --password admin

#清理操作
# 	apt-get autoclean && \
#   apt-get clean && \
#   apt-get autoremove

EXPOSE 8083
EXPOSE 80
EXPOSE 443
EXPOSE 3306

#主机控制面板
CMD ["bash"]
