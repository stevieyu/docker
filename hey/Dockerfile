FROM golang:alpine as builder
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk add --no-cache git upx binutils && \
	go get -v github.com/rakyll/hey && \
	CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o /go/bin/hey src/github.com/rakyll/hey/hey.go && \
	strip --strip-unneeded /go/bin/hey && \
	upx /go/bin/hey

FROM alpine:latest
WORKDIR /root
COPY --from=builder /go/bin/hey .
ENTRYPOINT ["/root/hey"]