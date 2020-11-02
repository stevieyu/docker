FROM php:alpine

ENV COMPOSER_ALLOW_SUPERUSER 1

# Install dev dependencies
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    curl-dev \
    imagemagick-dev \
    libtool \
    libxml2-dev \
    postgresql-dev \
    sqlite-dev && \
#
# Install production dependencies
    apk add --no-cache \
    bash \
    curl \
    freetype-dev \
    g++ \
    gcc \
    git \
    icu-dev \
    icu-libs \
    imagemagick \
    libc-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libzip-dev \
    make \
    mysql-client \
    nodejs \
    nodejs-npm \
    oniguruma-dev \
    yarn \
    openssh-client \
    postgresql-libs \
    rsync \
    zlib-dev && \
#
# Install PECL and PEAR extensions
    pecl install \
    imagick \
    swoole && \
#
# Enable PECL and PEAR extensions
    docker-php-ext-enable \
    imagick \
    swoole && \
#
# Configure php extensions
    docker-php-ext-configure gd --with-freetype --with-jpeg && \
#
# Install php extensions
    docker-php-ext-install \
    bcmath \
    calendar \
    curl \
    exif \
    gd \
    iconv \
    intl \
    mbstring \
    pdo \
    pdo_mysql \
    pdo_pgsql \
    pdo_sqlite \
    pcntl \
    tokenizer \
    xml \
    zip && \
#
# Install composer
    curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer && \
    composer config -g repositories.packagist composer https://mirrors.aliyun.com/composer/ && \
#
# Cleanup dev dependencies
    apk del -f .build-deps

# Setup working directory
WORKDIR /var/www