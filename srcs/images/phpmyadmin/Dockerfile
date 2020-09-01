FROM alpine:latest

RUN apk add --no-cache --upgrade bash mysql php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-session php7-json php7-mbstring wget
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-english.tar.gz
RUN tar -xzf phpMyAdmin-4.9.1-english.tar.gz 

COPY srcs/config.inc.php ./root/
COPY srcs/setup.sh .

RUN chmod +x setup.sh

EXPOSE 5000

CMD ./setup.sh
