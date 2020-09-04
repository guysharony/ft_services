FROM alpine:latest

RUN apk add --no-cache --upgrade bash --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

COPY srcs/wordpress.sql .
COPY srcs/database.sh .
COPY srcs/setup.sh .

RUN chmod +x wordpress.sql
RUN chmod +x database.sh
RUN chmod +x setup.sh

EXPOSE 3306

CMD ./setup.sh
