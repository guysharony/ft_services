FROM alpine:latest

RUN apk add --no-cache --upgrade bash mysql php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-session php7-json php7-mbstring openrc \
telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY srcs/script /root/script
COPY srcs/config /root/config
COPY srcs/files /root/files

RUN /root/script/config.sh

EXPOSE 5050

CMD /root/script/setup.sh
