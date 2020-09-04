cd grafana-6.6.0/

mkdir data
mv ../grafana.db ./data

cd bin/
telegraf &
./grafana-server
