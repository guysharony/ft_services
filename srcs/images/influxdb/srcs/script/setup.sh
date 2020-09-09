openrc
touch /run/openrc/softlevel
rc-update add telegraf

/etc/init.d/telegraf start
influxd run -config /etc/influxdb.conf
