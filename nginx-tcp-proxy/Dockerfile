FROM nginx:alpine

ADD stream.conf /etc/nginx/

RUN echo "include stream.conf;" >> /etc/nginx/nginx.conf && \
    nginx -t && \
    ln -sf /dev/stdout /var/log/nginx/stream-access.log