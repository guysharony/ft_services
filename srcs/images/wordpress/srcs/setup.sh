#!/bin/bash
apk add php7 php7-fpm php7-opcache
apk add php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-session php7-json php7-mbstring
apk add mysql
apk add wget

tar -xzf latest.tar.gz
rm -rf latest.tar.gz
mv wordpress ./www
mv wp-config.php www/
php -S 0.0.0.0:5050 -t ./www/
