FROM alpine:latest

RUN apk add --no-cache --upgrade bash --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz \
&& tar -zxf telegraf-1.15.2_linux_amd64.tar.gz \
&& cp -rf telegraf-1.15.2/etc/* /etc/ && cp -rf telegraf-1.15.2/usr/* /usr/

COPY srcs/telegraf.conf ./etc/telegraf/telegraf.conf
COPY srcs/wordpress.sql .
COPY srcs/database.sh .
COPY srcs/setup.sh .

RUN chmod +x wordpress.sql
RUN chmod +x database.sh
RUN chmod +x setup.sh

EXPOSE 3306

CMD ./setup.sh
