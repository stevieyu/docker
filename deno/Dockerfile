FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

WORKDIR ~

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
	apk add --no-cache axel && \
	axel https://github.com/storyicon/golang-proxy/releases/download/v2.0/goproxy-linux-x64.zip && \
	unzip goproxy-linux-x64.zip && \
	rm goproxy-linux-x64.zip
