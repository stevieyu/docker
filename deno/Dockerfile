FROM alpine:edge

ENV PATH="/root/.deno/bin:$PATH"

RUN find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/mirrors.sustech.edu.cn/g' \
    && apk add --no-cache deno \
    && deno install -A jsr:@deno/deployctl \
    && deployctl -h
