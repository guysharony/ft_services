#!/bin/bash
tar -xzf latest.tar.gz
rm -rf latest.tar.gz
mv wordpress ./www
mv wp-config.php www/
openrc
touch /run/openrc/softlevel
rc-update add telegraf

/etc/init.d/telegraf start
php -S 0.0.0.0:5050 -t ./www/
