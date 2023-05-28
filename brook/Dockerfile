FROM alpine:latest

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache axel \
    && axel https://github.com/txthinking/brook/releases/download/v20200801/brook \
    && chmod +x brook

ENTRYPOINT ["/root/brook"]
CMD ["--help"]