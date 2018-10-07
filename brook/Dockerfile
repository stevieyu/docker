FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
    && apk add --no-cache curl \
    && curl -L -O http://test.stevie.flyyweb.com/txthinking/brook/releases/download/v20180909/brook \
    && chmod +x brook

ENTRYPOINT ["/root/brook"]
CMD ["--help"]