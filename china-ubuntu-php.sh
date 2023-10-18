#!/bin/sh

# source <(curl -skL https://fastly.jsdelivr.net/gh/stevieyu/docker/china-ubuntu-php.sh)

apt install -y software-properties-common
  
add-apt-repository -y ppa:ondrej/php
sed -i 's/ppa/hono.dgcf.link\/ppa/' /etc/apt/sources.list.d/*-focal.list
apt update
  
apt install -y php8.2-cli php8.2-dom php8.2-sqlite3 php8.2-mysql php8.2-curl
sed -i 's/opcache.jit/;opcache.jit/' /etc/php/8.2/cli/conf.d/10-opcache.ini


ping -c 1 -W 1 mirrors.tencent.com > /dev/null 2>&1
if [ $? -eq 0 ]; then
 mirror=http://mirrors.tencentyun.com/composer/
else
 mirror=http://mirrors.tencent.com/composer/
fi

curl -k -o /usr/local/bin/composer ${mirror}composer.phar
chmod a+x /usr/local/bin/composer

export COMPOSER_ALLOW_SUPERUSER=1
echo 'export COMPOSER_ALLOW_SUPERUSER='$COMPOSER_ALLOW_SUPERUSER >> ~/.bashrc >> ~/.zshrc
composer config -g repositories.packagist composer ${mirror}
#composer config -g disable-tls true
composer config -g secure-http false
