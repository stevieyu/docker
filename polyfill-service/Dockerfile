FROM alpine

ENV NODE_ENV production

ADD https://cdn.jsdelivr.net/gh/stevieyu/docker/.npmrc /root/.npmrc
ADD --keep-git-dir=true https://github.com/Financial-Times/polyfill-service.git#v4.50.1 /app

WORKDIR /app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.cloud.tencent.com/g' /etc/apk/repositories && \
	#apk add --no-cache python make g++ && \

	npm install --production && \
    npm run build && \
    npm cache clear --force

EXPOSE 3000

CMD ["npm", "start"]