#!/bin/sh

# source <(curl -skL https://ghproxy.com/https://raw.githubusercontent.com/stevieyu/docker/master/china-ubuntu-php.sh)

apt install -y software-properties-common
  
add-apt-repository -y ppa:ondrej/php
sed -i 's/ppa/hono.dgcf.link\/ppa/' /etc/apt/sources.list.d/*-focal.list
apt update
  
apt install -y php8.2-cli php8.2-dom php8.2-sqlite3 php8.2-mysql php8.2-curl
sed -i 's/off/on/' /etc/php/8.2/cli/conf.d/10-opcache.ini
  
curl -k -o /usr/local/bin/composer https://mirrors.tencent.com/composer/composer.phar
chmod a+x /usr/local/bin/composer

export COMPOSER_ALLOW_SUPERUSER=1
echo 'export COMPOSER_ALLOW_SUPERUSER='$COMPOSER_ALLOW_SUPERUSER >> ~/.bashrc >> ~/.zshrc
composer config -g repositories.packagist composer https://mirrors.tencent.com/composer/
