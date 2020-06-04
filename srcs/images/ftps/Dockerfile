FROM alpine:latest

RUN apk add --no-cache --upgrade bash

COPY ./srcs/setup.sh .

RUN chmod +x setup.sh

EXPOSE 21 21000

CMD ./setup.sh && tail -f /dev/null