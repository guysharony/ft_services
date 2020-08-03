FROM alpine:latest

RUN apk add --no-cache --upgrade bash

COPY ./srcs/setup.sh .
COPY ./srcs/data ./data/

RUN chmod +x ./setup.sh
RUN chmod +x ./data

EXPOSE 8086

CMD ./setup.sh
