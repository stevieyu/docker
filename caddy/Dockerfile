FROM       alpine:latest
MAINTAINER Stevie "https://github.com/yzm629"

#https://caddyserver.com/api/download?os=linux&arch=amd64&p=github.com%2Fueffel%2Fcaddy-brotli
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
	&& plugins="http.cache,http.cors,http.expires,http.filebrowser,http.filter,http.forwardproxy,http.geoip,http.git,http.minify" \
    && apk add --no-cache axel \
    && axel -o caddy.tar.gz "https://caddyserver.com/download/linux/amd64?plugins=$plugins&license=personal&telemetry=off" \
    && tar -vf caddy.tar.gz -C /usr/bin/ -xz caddy \
    && chmod 0755 /usr/bin/caddy \
    && rm caddy.tar.gz \
    && apk del axel

EXPOSE 80 443 2015

ENTRYPOINT ["/usr/bin/caddy"]

CMD ["--conf", "/etc/Caddyfile", "--log", "stdout"]
