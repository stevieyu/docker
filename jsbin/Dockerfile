FROM       node:0.10
MAINTAINER Stevie "https://github.com/yzm629"

#nodejs tools
RUN npm config set registry https://registry.npm.taobao.org && \
    git clone https://github.com/jsbin/jsbin.git /root/jsbin

WORKDIR /root/jsbin
RUN npm i && \
    sed -i 's/localhost:3000/docker:3000/g' config.default.json

EXPOSE 3000

CMD ["./bin/jsbin"]
