FROM alpine:latest

RUN apk add --no-cache --upgrade bash

COPY srcs/nginx.conf ./root/
COPY srcs/setup.sh .

RUN chmod +x setup.sh

EXPOSE 80 443

CMD ./setup.sh
