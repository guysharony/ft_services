FROM alpine:latest

RUN apk add --no-cache --upgrade bash --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat

COPY srcs/ssh_host_rsa_key .
COPY srcs/ssh_host_dsa_key .
COPY srcs/sshd_config .
COPY srcs/nginx.conf ./root/
COPY srcs/setup.sh .

RUN chmod +x setup.sh

EXPOSE 80 443 22

CMD ./setup.sh
