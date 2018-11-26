FROM alpine:latest
MAINTAINER Stevie yzm629@gmail.com

WORKDIR /root

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache nodejs nodejs-npm git && \

    npm config set registry http://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=http://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs && \

    git clone --depth=1 https://github.com/CloudBoost/cloudboost.git && \
    cd cloudboost && \
    npm i 


#ENTRYPOINT ["/root/.acme.sh/acme.sh"]
#CMD ["--help"]