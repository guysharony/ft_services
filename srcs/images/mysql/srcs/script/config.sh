mv /root/config/telegraf.conf /etc/telegraf.conf

/root/script/database.sh > /dev/null 2>&1 &

sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld/

openrc
touch /run/openrc/softlevel
rc-update add telegraf
