FROM alpine:latest

RUN apk add --no-cache --upgrade bash mysql php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-session php7-json php7-mbstring wget openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-english.tar.gz && tar -xzf phpMyAdmin-4.9.1-english.tar.gz

RUN mkdir ft_services

COPY srcs/script ft_services/script
COPY srcs/config ft_services/config

RUN chmod +x setup.sh

EXPOSE 5000

CMD ft_services/script/setup.sh
