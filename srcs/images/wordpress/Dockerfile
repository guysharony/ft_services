FROM alpine:latest

RUN apk add --no-cache --upgrade bash

COPY srcs/latest.tar.gz .
COPY srcs/wp-config.php .
COPY srcs/setup.sh .

RUN chmod +x latest.tar.gz
RUN chmod +x wp-config.php
RUN chmod +x setup.sh

EXPOSE 5050

CMD ./setup.sh
