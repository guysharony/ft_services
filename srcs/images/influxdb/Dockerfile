FROM alpine:latest

RUN apk add --no-cache --upgrade bash wget influxdb openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY srcs/liveness.sh .
COPY ./srcs/telegraf.conf ./etc/telegraf.conf
COPY ./srcs/setup.sh .

RUN chmod +x ./setup.sh

EXPOSE 8086

CMD ./setup.sh
