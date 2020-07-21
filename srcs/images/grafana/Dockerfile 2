FROM alpine:latest

RUN apk add --no-cache --upgrade bash

COPY ./srcs/grafana.db .
COPY ./srcs/setup.sh .

RUN chmod +x setup.sh
RUN chmod +x grafana.db

EXPOSE 3000

CMD ./setup.sh