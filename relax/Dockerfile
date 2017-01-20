FROM       ubuntu:devel
MAINTAINER Stevie "https://github.com/yzm629"

#https://github.com/relax/relax

RUN sed -i 's/archive.ubuntu.com/mirrors.aliyun.com/g' /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y curl build-essential python make libvips-dev mongodb && \
    curl -sL https://deb.nodesource.com/setup_7.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    npm config set registry https://registry.npm.taobao.org && \
	npm config set disturl https://npm.taobao.org/dist && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=https://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=https://npm.taobao.org/mirrors/phantomjs && \
    npm install -g sharp && \
#http://sharp.readthedocs.io/en/stable/install/
	curl -s https://raw.githubusercontent.com/lovell/sharp/master/preinstall.sh | bash - && \

	git clone https://github.com/relax/relax.git /root/relax && \
    cd /root/relax && \
    npm i

WORKDIR /root/relax

CMD ["node"]
