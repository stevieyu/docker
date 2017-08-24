FROM       alpine:edge
MAINTAINER Stevie yzm629@gmail.com

WORKDIR ~

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    echo http://mirrors.ustc.edu.cn/alpine/edge/testing >> /etc/apk/repositories && \
	apk add --no-cache git make

CMD ["sh"]