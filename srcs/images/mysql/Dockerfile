FROM alpine:latest

RUN apk add --no-cache --upgrade bash mariadb mariadb-client mysql mysql-client openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN mkdir ft_services

COPY srcs/script ft_services/script
COPY srcs/config ft_services/config
COPY srcs/files ft_services/files

EXPOSE 3306

CMD ft_services/script/setup.sh
