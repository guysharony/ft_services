#!/bin/bash
apk add php7 php7-fpm php7-opcache
apk add php7-gd php7-mysqli php7-json php7-zlib php7-curl php7-session php7-mbstring
apk add wget
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-english.tar.gz
tar -xzf phpMyAdmin-4.9.1-english.tar.gz
mv phpMyAdmin-4.9.1-english ./www
rm -rf ./www/config.sample.inc.php
mv ./root/config.inc.php ./www/
chmod 644 ./www/config.inc.php
php -S 0.0.0.0:5000 -t ./www/
