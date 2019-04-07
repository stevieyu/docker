FROM golang:alpine as builder

ADD demo /demo

WORKDIR /demo

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
	apk add --no-cache git upx alpine-sdk && \
	go get github.com/vugu/vugu/simplehttp && \
	go build devserver.go && \
	strip --strip-unneeded devserver && \
	upx devserver

FROM alpine:latest
WORKDIR /root
COPY --from=builder /demo/devserver .

CMD ["/root/devserver"]