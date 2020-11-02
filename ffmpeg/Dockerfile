FROM       alpine:latest
MAINTAINER Stevie "https://github.com/yzm629"

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache ffmpeg

ENTRYPOINT ["ffmpeg"]
CMD ["-h"]
