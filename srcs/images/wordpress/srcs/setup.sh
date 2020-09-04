#!/bin/bash
tar -xzf latest.tar.gz
rm -rf latest.tar.gz
mv wordpress ./www
mv wp-config.php www/
telegraf &
php -S 0.0.0.0:5050 -t ./www/
