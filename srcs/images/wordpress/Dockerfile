FROM alpine:latest

RUN apk add --no-cache --upgrade bash mysql php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-session php7-json php7-mbstring --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN apk add openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY srcs/telegraf.conf ./etc/telegraf.conf
COPY srcs/latest.tar.gz .
COPY srcs/wp-config.php .
COPY srcs/setup.sh .

RUN chmod +x latest.tar.gz
RUN chmod +x wp-config.php
RUN chmod +x setup.sh

EXPOSE 5050

CMD ./setup.sh
