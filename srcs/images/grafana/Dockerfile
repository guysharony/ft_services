FROM alpine:latest

RUN apk add --no-cache --upgrade bash wget php7 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz \
&& tar -zxvf grafana-6.6.0.linux-amd64.tar.gz

RUN apk add openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY ./srcs/telegraf.conf ./etc/telegraf.conf
COPY ./srcs/grafana.db .
COPY ./srcs/setup.sh .

RUN chmod +x setup.sh
RUN chmod +x grafana.db

EXPOSE 3000

CMD ./setup.sh
