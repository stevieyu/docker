FROM       alpine:edge
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

ENV VERSION=3.1.4

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    echo http://mirrors.ustc.edu.cn/alpine/edge/testing >> /etc/apk/repositories && \
	apk add --no-cache curl g++ make && \

	curl -O http://download.joedog.org/siege/siege-${VERSION}.tar.gz && \
	tar -vxf siege-${VERSION}.tar.gz && \
	rm siege-${VERSION}.tar.gz && \
	cd siege-${VERSION} && \

	./configure && \
	make install && \

	rm -rf /root/siege-${VERSION}

ENTRYPOINT ["siege"]
CMD ["-h"]