FROM alpine:latest

RUN apk add --no-cache --upgrade bash mysql php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-session php7-json php7-mbstring wget --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-english.tar.gz && tar -xzf phpMyAdmin-4.9.1-english.tar.gz 
RUN apk add openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY srcs/telegraf.conf ./etc/telegraf.conf
COPY srcs/config.inc.php ./root/
COPY srcs/setup.sh .

RUN chmod +x setup.sh

EXPOSE 5000

CMD ./setup.sh
