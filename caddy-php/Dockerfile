FROM php:rc-fpm-stretch

# Install Caddy
RUN curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/linux/amd64?plugins=http.expires,http.realip&license=personal&telemetry=off" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
    && chmod 0755 /usr/bin/caddy \
    && caddy -version \
    && docker-php-ext-install mbstring pdo pdo_mysql opcache \
    && mkdir -p /www/public

COPY Caddyfile /etc/Caddyfile

WORKDIR /www

EXPOSE 80 443 2015

CMD ["/usr/bin/caddy", "--conf", "/etc/Caddyfile", "--log", "stdout"]