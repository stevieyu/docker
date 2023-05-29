FROM node:16-alpine

ADD https://cdn.jsdelivr.net/gh/stevieyu/docker/.npmrc /root/.npmrc

WORKDIR /app

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.cloud.tencent.com/g' /etc/apk/repositories && \
	apk add --no-cache --virtual .build-deps curl python3 make g++  && \

    curl -k -L https://github.com/Financial-Times/polyfill-service/archive/refs/tags/v4.50.1.tar.gz | tar -vxz --strip-components=1 -C /app && \
	npm install && \
    npm run build && \
    npm npm prune --omit=dev --omit=optional && \
    npm cache clear --force && \
    apk del -f .build-deps

EXPOSE 3000

CMD ["npm", "start"]