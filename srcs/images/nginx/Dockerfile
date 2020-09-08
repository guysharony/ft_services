FROM alpine:latest

RUN apk add --no-cache --upgrade bash nginx openrc openssl openssh telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN mkdir ft_services

COPY srcs/script ft_services/script
COPY srcs/config ft_services/config
COPY srcs/sshd ft_services/sshd

RUN chmod +x ft_services/script/* \
&& ft_services/script/config.sh

EXPOSE 80 443 22

CMD ft_services/script/setup.sh
