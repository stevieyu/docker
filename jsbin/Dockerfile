FROM       alpine:latest
MAINTAINER Stevie "https://github.com/yzm629"

ENV VERSION=v0.10.48 \
	CFLAGS="-D__USE_MISC" \
	RM_DIRS=/usr/include

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
	apk add --no-cache libgcc libstdc++ && \
	apk add --no-cache --virtual .build-deps curl make gcc g++ python linux-headers paxctl gnupg && \

	curl -o node-${VERSION}.tar.gz -sSL https://npm.taobao.org/mirrors/node/${VERSION}/node-${VERSION}.tar.gz && \
	tar -zxf node-${VERSION}.tar.gz && \
	cd node-${VERSION} && \
	export GYP_DEFINES="linux_use_gold_flags=0" && \
	./configure --prefix=/usr && \
	NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
	make -j${NPROC} -C out mksnapshot BUILDTYPE=Release && \
	paxctl -cm out/Release/mksnapshot && \
	make -j${NPROC} && \
	make install && \
	paxctl -cm /usr/bin/node && \

	apk del .build-deps ${DEL_PKGS} && \
	rm -rf /etc/ssl /node-${VERSION}.tar.gz /node-${VERSION} ${RM_DIRS} \
	/usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp /root/.gnupg \
	/usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html

	#镜像切换
RUN	npm config set registry https://registry.npm.taobao.org && \
	npm config set disturl https://npm.taobao.org/dist && \
	npm config set loglevel http && \
	npm config set SASS_BINARY_SITE https://npm.taobao.org/mirrors/node-sass && \
	npm config set PHANTOMJS_CDNURL https://npm.taobao.org/mirrors/phantomjs && \
	npm config set SQLITE3_BINARY_SITE http://npm.taobao.org/mirrors/sqlite3 && \
	npm config set ELECTRON_MIRROR http://npm.taobao.org/mirrors/electron/ && \

	#安装jsbin
	apk add --no-cache git make gcc g++ python && \
	git clone --depth=1 https://git.coding.net/yzm/jsbin.git /root/jsbin && \
    cd /root/jsbin && \
    npm i -g grunt-cli && \
    npm i && \
    grunt build

WORKDIR /root/jsbin

ADD ./config.local.json ./

EXPOSE 3000

CMD ["./bin/jsbin"]
