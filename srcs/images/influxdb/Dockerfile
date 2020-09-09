FROM alpine:latest

RUN apk add --no-cache --upgrade bash wget influxdb openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN mkdir ft_services

COPY srcs/script ft_services/script
COPY srcs/config ft_services/config

EXPOSE 8086

CMD ft_services/script/setup.sh
