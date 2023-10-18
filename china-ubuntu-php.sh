#!/bin/sh

# curl -skL https://ghproxy.com/https://raw.githubusercontent.com/stevieyu/docker/master/china-ubuntu-php.sh | sh

apt install -y software-properties-common
  
add-apt-repository -y ppa:ondrej/php
sed -i 's/ppa/hono.dgcf.link/ppa/' /etc/apt/sources.list.d/ondrej-ubuntu-php-focal.list
  
apt -y install php8.2-cli
  
curl -k -o /usr/local/bin/composer https://mirrors.tencent.com/composer/composer.phar
chmod a+x /usr/local/bin/composer

export COMPOSER_ALLOW_SUPERUSER=1
echo 'export COMPOSER_ALLOW_SUPERUSER='$COMPOSER_ALLOW_SUPERUSER >> ~/.bashrc
composer config -g repositories.packagist composer https://mirrors.tencent.com/composer/
