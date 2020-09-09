FROM alpine:latest

RUN apk add --no-cache --upgrade bash wget php7 --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN wget https://dl.grafana.com/oss/release/grafana-6.6.0.linux-amd64.tar.gz \
&& tar -zxvf grafana-6.6.0.linux-amd64.tar.gz

RUN apk add openrc telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN mkdir ft_services

COPY srcs/script ft_services/script
COPY srcs/config ft_services/config
COPY srcs/files ft_services/files

EXPOSE 3000

CMD ft_services/script/setup.sh
