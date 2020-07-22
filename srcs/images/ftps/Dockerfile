FROM alpine:latest

RUN apk add --no-cache --upgrade bash

COPY ./srcs/pure-ftpd.apk .
COPY ./srcs/setup.sh .

RUN chmod +x pure-ftpd.apk
RUN chmod +x setup.sh

EXPOSE 21 21000

CMD ./setup.sh && tail -f /dev/null
