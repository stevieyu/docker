FROM       alpine:edge
MAINTAINER Stevie yzm629@gmail.com

WORKDIR ~

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    echo http://mirrors.ustc.edu.cn/alpine/edge/testing >> /etc/apk/repositories && \
	apk add --no-cache wget make gcc g++ && \

	wget http://download.joedog.org/siege/siege-3.1.4.tar.gz && \
	tar -vxf siege-3.1.4.tar.gz && \
	mv siege-3.1.4 siege && \
	cd siege && \
	./configure && \
	make && \
	make install

ENTRYPOINT ["siege"]
CMD ["-h"]