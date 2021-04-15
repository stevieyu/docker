FROM golang:alpine

ADD demo /demo

WORKDIR /demo

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
	apk add --no-cache git && \
	go env -w GOPROXY=https://goproxy.cn,direct && \
	go get -u github.com/vugu/vgrun && \
	vgrun -install-tools

CMD ["vgrun", "devserver"]