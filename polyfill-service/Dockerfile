FROM       alpine:latest

ENV NODE_ENV production

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
	apk add --no-cache nodejs nodejs-npm git python make g++ && \

    npm config set registry http://registry.npm.taobao.org && \
    npm config set loglevel=http && \
    npm config set sass_binary_site=http://npm.taobao.org/mirrors/node-sass && \
    npm config set phantomjs_cdnurl=http://npm.taobao.org/mirrors/phantomjs && \

    git clone --depth=1 https://github.com/Financial-Times/polyfill-service.git /root/app && \
	cd /root/app && \
	npm install --production && \
    npm run build && \
    npm cache clear --force

EXPOSE 3000

WORKDIR /root/app

CMD ["npm", "start"]