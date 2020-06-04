FROM alpine:latest

RUN apk add --no-cache --upgrade bash

COPY ./srcs/setup.sh .
COPY ./srcs/data .

RUN chmod +x ./setup.sh
RUN chmod +x ./data

EXPOSE 8086

CMD ls -la && ./setup.sh && tail -f /dev/null
