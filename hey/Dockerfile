FROM       golang:alpine
MAINTAINER Stevie yzm629@gmail.com

WORKDIR ~

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk add --no-cache git && \
	go get -u github.com/rakyll/hey

ENTRYPOINT ["hey"]