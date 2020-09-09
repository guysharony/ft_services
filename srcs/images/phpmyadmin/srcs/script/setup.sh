#!/bin/bash
mv phpMyAdmin-4.9.1-english ./www
rm -rf ./www/config.sample.inc.php
mv ./root/config.inc.php ./www/
chmod 644 ./www/config.inc.php
openrc
touch /run/openrc/softlevel
rc-update add telegraf

/etc/init.d/telegraf start
php -S 0.0.0.0:5000 -t ./www/
