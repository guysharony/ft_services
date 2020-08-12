FROM alpine:latest

RUN apk add --no-cache --upgrade bash

COPY srcs/ssh_host_rsa_key .
COPY srcs/ssh_host_dsa_key .
COPY srcs/sshd_config .
COPY srcs/nginx.conf ./root/
COPY srcs/setup.sh .

RUN chmod +x setup.sh

EXPOSE 80 443 22

CMD ./setup.sh
