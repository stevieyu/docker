FROM       alpine:edge
MAINTAINER Stevie "https://github.com/yzm629"

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    echo http://mirrors.ustc.edu.cn/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache ffmpeg

ENTRYPOINT ["ffmpeg"]
CMD ["-h"]
