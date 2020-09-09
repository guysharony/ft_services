openrc
touch /run/openrc/softlevel
rc-update add telegraf

/etc/init.d/telegraf start

cd grafana-6.6.0/

mkdir data
mv ../grafana.db ./data

cd bin/
./grafana-server
