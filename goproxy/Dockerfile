FROM golang:alpine AS builder

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
    apk add --no-cache ca-certificates git upx binutils g++; \
	go get -v github.com/snail007/goproxy; \
	GOOS=linux go build -a -x -installsuffix cgo -o /go/bin/goproxy src/github.com/snail007/goproxy/main.go; \
	strip --strip-unneeded /go/bin/goproxy; \
	upx /go/bin/goproxy

FROM alpine:latest
WORKDIR /root
ADD . .
COPY --from=builder /go/bin/goproxy .

ENTRYPOINT ["/root/goproxy"]
