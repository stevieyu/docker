FROM golang:alpine as builder

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
	apk add --no-cache git upx binutils g++ && \
	go get -v github.com/storyicon/golang-proxy && \
	GOOS=linux go build -a -x -installsuffix cgo -o /go/bin/golang-proxy src/github.com/storyicon/golang-proxy/main.go && \
	strip --strip-unneeded /go/bin/golang-proxy && \
	upx /go/bin/golang-proxy


FROM alpine:latest
WORKDIR /root
COPY --from=builder /go/bin/golang-proxy .
VOLUME ["/root/source"]
EXPOSE 9999
ENTRYPOINT ["/root/golang-proxy"]
