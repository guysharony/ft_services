FROM alpine:latest

RUN apk add --no-cache --upgrade bash mariadb mariadb-client mysql mysql-client openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY srcs/liveness.sh .
COPY srcs/telegraf.conf ./etc/telegraf.conf
COPY srcs/wordpress.sql .
COPY srcs/database.sh .
COPY srcs/setup.sh .

RUN chmod +x wordpress.sql
RUN chmod +x database.sh
RUN chmod +x setup.sh

EXPOSE 3306

CMD ./setup.sh
