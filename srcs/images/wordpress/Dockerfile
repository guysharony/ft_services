FROM alpine:latest

RUN apk add --no-cache --upgrade bash mysql php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-session php7-json php7-mbstring --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz \
&& tar -zxf telegraf-1.15.2_linux_amd64.tar.gz \
&& cp -rf telegraf-1.15.2/etc/* /etc/ && cp -rf telegraf-1.15.2/usr/* /usr/

COPY srcs/telegraf.conf ./etc/telegraf/telegraf.conf
COPY srcs/latest.tar.gz .
COPY srcs/wp-config.php .
COPY srcs/setup.sh .

RUN chmod +x latest.tar.gz
RUN chmod +x wp-config.php
RUN chmod +x setup.sh

EXPOSE 5050

CMD ./setup.sh
