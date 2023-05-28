FROM alpine

ENV NODE_ENV production

ADD https://cdn.jsdelivr.net/gh/stevieyu/docker/.npmrc /root/.npmrc

WORKDIR /app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.cloud.tencent.com/g' /etc/apk/repositories && \
	apk add --no-cache curl && \

    curl -k -L https://github.com/Financial-Times/polyfill-service/archive/refs/tags/v4.50.1.tar.gz | tar -vxz --strip-components=1 -C /app
	npm install --production && \
    npm run build && \
    npm cache clear --force

EXPOSE 3000

CMD ["npm", "start"]