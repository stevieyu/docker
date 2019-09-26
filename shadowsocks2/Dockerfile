FROM golang:alpine AS builder

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
    apk add --no-cache ca-certificates git upx binutils g++; \
	go get -v github.com/shadowsocks/go-shadowsocks2; \
	GOOS=linux go build -a -x -installsuffix cgo -o /go/bin/go-shadowsocks2 src/github.com/shadowsocks/go-shadowsocks2/main.go; \
	strip --strip-unneeded /go/bin/go-shadowsocks2; \
	upx /go/bin/go-shadowsocks2

FROM alpine:latest
WORKDIR /root
ADD . .
COPY --from=builder /go/bin/go-shadowsocks2 .

ENTRYPOINT ["/root/go-shadowsocks2"]
