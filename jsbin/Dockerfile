FROM       node:0.10
MAINTAINER Stevie "https://github.com/yzm629"

#nodejs tools
RUN sed -i 's/httpredir.debian.org/mirrors.163.com/g' /etc/apt/sources.list && \
    npm config set registry https://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=https://npm.taobao.org/mirrors/node-sass && \
    git clone https://github.com/jsbin/jsbin.git /root/jsbin

WORKDIR /root/jsbin

RUN npm i && \
    sed -i 's/localhost:3000/127.0.0.1:3000/g' config.default.json

EXPOSE 3000

CMD ["./bin/jsbin"]
