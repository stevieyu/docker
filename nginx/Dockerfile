FROM       alpine:latest
MAINTAINER Stevie "https://github.com/yzm629"

WORKDIR ~

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    apk add --no-cache nginx && \
    mkdir -p /run/nginx

CMD ["nginx", "-g", "daemon off;"]