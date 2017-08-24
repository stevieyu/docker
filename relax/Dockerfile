FROM       node:6
MAINTAINER Stevie "https://github.com/yzm629"

#https://github.com/relax/relax

ENV relax_db__uri="mongodb://127.0.0.1/relax"

WORKDIR /root

RUN sed -i 's/deb.debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y git libvips-dev mongodb && \

    npm config set registry https://registry.npm.taobao.org && \
	npm config set disturl https://npm.taobao.org/dist && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=https://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=https://npm.taobao.org/mirrors/phantomjs && \

	git clone --depth=1 https://github.com/relax/relax.git && \
    cd relax && \
    npm i && \
    npm run build

WORKDIR /root/relax

EXPOSE 8080

CMD ["npm start"]
