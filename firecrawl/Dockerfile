FROM node:alpine as base

RUN find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/mirror.sjtu.edu.cn/g' \
    && apk add --no-cache redis \
    && corepack enable

RUN sed -i -E "s/^protected-mode yes/protected-mode no/g" /etc/redis.conf \
    && sed -i -E "s/^bind/#bind/g" /etc/redis.conf




FROM base as source

RUN apk add curl \
    && curl -kL https://gh.ddlc.top/https://github.com/mendableai/firecrawl/archive/refs/heads/main.tar.gz | tar -xz \
    && mv firecrawl-main/apps/api /app

WORKDIR /app


FROM source AS prod-deps

RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --prod --frozen-lockfile



FROM source AS build

RUN --mount=type=cache,id=pnpm,target=/pnpm/store pnpm install --frozen-lockfile

RUN pnpm install
RUN pnpm run build





FROM base as runner

COPY --from=prod-deps /app/node_modules /app/node_modules
COPY --from=build /app /app

WORKDIR /app

EXPOSE 3002
ENV PUPPETEER_EXECUTABLE_PATH="/usr/bin/chromium"

# CMD ["redis-server", "/etc/redis.conf"]
# CMD [ "npm", "run", "start:production" ]
# CMD [ "npm", "run", "worker:production" ]
CMD "(redis-server /etc/redis.conf) & (npm run start:production) & (npm run worker:production)"
