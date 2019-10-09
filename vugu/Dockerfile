FROM golang:alpine as builder

ADD demo /demo

WORKDIR /demo

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
	apk add --no-cache git && \
	go env -w GOPROXY=https://goproxy.cn,direct && \
	go get github.com/vugu/vugu/simplehttp && \
	go build devserver.go

FROM alpine:latest
WORKDIR /root
COPY --from=builder /demo/devserver .

CMD ["/root/devserver"]