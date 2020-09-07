FROM alpine:latest

RUN apk add --no-cache --upgrade bash nginx openrc openssl openssh
RUN apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

COPY srcs/telegraf.conf ./etc/telegraf.conf
COPY srcs/ssh_host_rsa_key .
COPY srcs/ssh_host_dsa_key .
COPY srcs/sshd_config .
COPY srcs/nginx.conf ./root/
COPY srcs/setup.sh .

RUN openrc \
&& touch /run/openrc/softlevel \
&& rc-update add sshd \
&& rc-update add telegraf

RUN chmod +x setup.sh

EXPOSE 80 443 22

CMD ./setup.sh
