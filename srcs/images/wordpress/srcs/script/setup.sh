mv ./wordpress ./www
mv ./root/config/wp-config.php ./www/
/etc/init.d/telegraf start
php -S 0.0.0.0:5050 -t ./www/
