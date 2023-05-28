FROM alpine:edge

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --no-cache rethinkdb

VOLUME ["/data"]

WORKDIR /data

EXPOSE 28015 29015 8080

ENTRYPOINT ["rethinkdb"]
CMD ["--bind", "all"]