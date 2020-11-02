#https://www.tuicool.com/articles/nIBBv2R
FROM golang:alpine as builder
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk add --no-cache git upx alpine-sdk && \
	git clone --depth=1 https://github.com/creytiv/re.git && \
	cd re && \
	make RELEASE=1 && \
	ldconfig && \
	upx /go/bin/hey

FROM alpine:latest
WORKDIR /root
COPY --from=builder /go/bin/hey .
ENTRYPOINT ["/root/hey"]