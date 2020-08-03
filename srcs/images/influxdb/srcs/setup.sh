apk add influxdb

influxd restore -metadir /var/lib/influxdb/meta ./data
influxd restore -database grafana -datadir /var/lib/influxdb/data ./data

influxd run -config /etc/influxdb.conf
