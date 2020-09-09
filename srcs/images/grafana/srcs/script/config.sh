mv /root/config/telegraf.conf /etc/telegraf.conf

openrc
touch /run/openrc/softlevel
rc-update add telegraf

cd /grafana
mkdir data

mv /root/files/grafana.db /grafana/data/

chmod +x /root/script/setup.sh
