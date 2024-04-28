FROM germey/proxypool
# FROM jhao104/proxy_pool

RUN find /etc -regex '.*\(repositories\|sources.list\(.d\/.*\)?\)$' | xargs sed -i -E 's/(archive|security).ubuntu.com|(deb).debian.org|dl-cdn.alpinelinux.org/mirror.sjtu.edu.cn/g' \
    && apk add --no-cache redis

RUN sed -i -E "s/^protected-mode yes/protected-mode no/g" /etc/redis.conf \
    && sed -i -E "s/^bind/#bind/g" /etc/redis.conf


ADD supervisord.conf /tmp/
RUN cat /tmp/supervisord.conf >> supervisord.conf && rm /tmp/supervisord.conf

# 5555 5010

# ENTRYPOINT []
# CMD "redis-server /etc/redis.conf & sh start.sh"
