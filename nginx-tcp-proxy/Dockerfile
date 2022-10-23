FROM nginx:alpine

ADD stream.conf /etc/nginx/

RUN sed -i 's/dl-cdn.alpinelinux.org/repo.huaweicloud.com/g' /etc/apk/repositories && \
    echo "include stream.conf;" >> /etc/nginx/nginx.conf && \
    nginx -t && \
    ln -sf /dev/stdout /var/log/nginx/stream-access.log