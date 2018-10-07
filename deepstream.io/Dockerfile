FROM       node:alpine
MAINTAINER Stevie yzm629@gmail.com

ENV DEEPSTREAM_PATH /opt/deepstream
ENV DEEPSTREAM_CONF /opt/deepstream/conf
ENV DEEPSTREAM_PLUGINS /opt/deepstream/plugins

RUN mkdir -p /opt

WORKDIR /opt

#https://pkgs.alpinelinux.org/packages
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \

    npm config set registry http://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=http://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs && \
    npm config set sqlite3_binary_site=http://npm.taobao.org/mirrors/sqlite3 && \
    npm config set electron_mirror=http://npm.taobao.org/mirrors/electron/ && \

    apk --no-cache --virtual build-deps add \
    # Build dependencies necessary for compiling Node.js extensions, etc.
        python=2.7.13-r1 \
        make=4.2.1-r0 \
        g++=6.3.0-r4 \
        git=2.13.0-r0 \
    git clone https://github.com/deepstreamIO/deepstream.io.git deepstream && \
    cd deepstream && \
    npm install --only=production && \
    mkdir plugins && \
    # Build dependencies no longer needed, so delete them all
    apk del build-deps

WORKDIR $DEEPSTREAM_PATH

# 6020: WebSocket
EXPOSE 6020

VOLUME ["/opt/deepstream/conf", "/opt/deepstream/plugins"]

CMD ["./bin/deepstream", "start", "--config", "/opt/deepstream/conf/config.yml", "--lib-dir", "/opt/deepstream/plugins"]