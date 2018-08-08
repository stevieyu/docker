#!/bin/sh

mysqld_safe --user=root&
php -S 0.0.0.0:80 -t /root/piwik
