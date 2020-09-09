FROM alpine:latest

RUN apk add --no-cache --upgrade bash openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY srcs/liveness.sh .
COPY ./srcs/telegraf.conf ./etc/telegraf.conf
COPY ./srcs/pure-ftpd.apk .
COPY ./srcs/setup.sh .

RUN chmod +x pure-ftpd.apk
RUN chmod +x setup.sh

EXPOSE 21 21000

CMD ./setup.sh
