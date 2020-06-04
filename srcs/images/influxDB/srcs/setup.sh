apk add influxdb

influxd run -config /etc/influxdb.conf > /dev/null 2>&1 &
rm -rf ./var/lib/influxdb/data/ 
