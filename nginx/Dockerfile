FROM       alpine:edge
MAINTAINER Stevie "https://github.com/yzm629"

WORKDIR ~

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
    echo http://mirrors.ustc.edu.cn/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache nginx && \
    mkdir -p /run/nginx

CMD ["nginx", "-g", "daemon off;"]