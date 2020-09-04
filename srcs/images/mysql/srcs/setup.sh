#!/bin/bash
apk add mariadb mariadb-client mysql mysql-client

./database.sh > /dev/null 2>&1 &

sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld/
telegraf &
mysql_install_db --user=root --datadir="/var/lib/mysql"
/usr/bin/mysqld --user=root
