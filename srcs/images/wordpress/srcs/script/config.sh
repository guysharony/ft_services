mv ./root/config/telegraf.conf ./etc/telegraf.conf
mv ./root/files/latest.tar.gz ./wordpress.tar.gz
tar -xf wordpress.tar.gz
ls -la
mv ./wordpress ./www
mv ./root/config/wp-config.php ./www

openrc
touch /run/openrc/softlevel
rc-update add telegraf
