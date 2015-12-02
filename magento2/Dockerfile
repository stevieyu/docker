FROM       ubuntu:15.10
MAINTAINER Stevie "https://github.com/yzm629"

#更换为网易镜像
RUN sed -i 's/archive.ubuntu.com/mirrors.163.com/g' /etc/apt/sources.list

#安装&更新
RUN apt-get update && \
    apt-get install -y apache2 && \
    mysql-server-5.6 mysql-client-5.6 && \
    php5 php5-mhash php5-mcrypt php5-curl php5-cli php5-mysqlnd php5-gd php5-intl php5-xsl php5-bcmath

#apache 开启伪静态
RUN a2enmod rewrite

EXPOSE 80
EXPOSE 443
EXPOSE 3306

CMD ["/usr/sbin/sshd", "-D"]
