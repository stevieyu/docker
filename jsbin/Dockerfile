FROM       node:0.10
MAINTAINER Stevie "https://github.com/yzm629"

#nodejs tools
RUN sed -i 's/deb.debian.org/mirrors.163.com/g' /etc/apt/sources.list && \
    git clone --depth=1 https://git.coding.net/yzm/jsbin.git /root/jsbin

WORKDIR /root/jsbin

ADD ./config.local.json ./

RUN npm config set registry https://registry.npm.taobao.org && \
	npm config set disturl https://npm.taobao.org/dist && \
    npm config set loglevel http && \
    npm config set SASS_BINARY_SITE https://npm.taobao.org/mirrors/node-sass && \
    npm config set PHANTOMJS_CDNURL https://npm.taobao.org/mirrors/phantomjs && \
	npm config set SQLITE3_BINARY_SITE http://npm.taobao.org/mirrors/sqlite3 && \
    npm config set ELECTRON_MIRROR http://npm.taobao.org/mirrors/electron/ && \
	npm i grunt-cli -g && npm i && grunt build

EXPOSE 3000

CMD ["./bin/jsbin"]

#helper
#http://www.codeweblog.com/js-bin%E6%9C%AC%E5%9C%B0%E7%8E%AF%E5%A2%83%E5%AE%89%E8%A3%85%E6%AD%A5%E9%AA%A4-ubuntu/