apk add php7
apk add wget
apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz
tar -zxvf grafana-6.6.0.linux-amd64.tar.gz

cd grafana-6.6.0/

mkdir data
mv ../grafana.db ./data

cd bin/
./grafana-server