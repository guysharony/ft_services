FROM alpine:latest

RUN apk add --no-cache --upgrade bash mysql php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-session php7-json php7-mbstring

COPY srcs/latest.tar.gz .
COPY srcs/wp-config.php .
COPY srcs/setup.sh .

RUN chmod +x latest.tar.gz
RUN chmod +x wp-config.php
RUN chmod +x setup.sh

EXPOSE 5050

CMD ./setup.sh
