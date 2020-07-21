FROM alpine:latest

RUN apk add --no-cache --upgrade bash

COPY srcs/config.inc.php ./root/
COPY srcs/setup.sh .

RUN chmod +x setup.sh

EXPOSE 5000

CMD ./setup.sh && tail -f /dev/null
