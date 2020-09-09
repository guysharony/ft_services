FROM alpine:latest

RUN apk add --no-cache --upgrade bash mysql \
php7 php7-fpm php7-mysqli php7-zlib php7-mbstring \
php7-session php7-json php7-mbstring wget openrc \
telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-english.tar.gz \
&& tar -xzf phpMyAdmin-4.9.1-english.tar.gz

COPY srcs/script /root/script
COPY srcs/config /root/config

RUN /root/script/config.sh

EXPOSE 5000

CMD /root/script/setup.sh
