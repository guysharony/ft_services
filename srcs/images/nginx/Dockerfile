FROM alpine:latest

RUN apk add --no-cache --upgrade bash --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz \
&& tar -zxf telegraf-1.15.2_linux_amd64.tar.gz \
&& cp -rf telegraf-1.15.2/etc/* /etc/ && cp -rf telegraf-1.15.2/usr/* /usr/

COPY srcs/telegraf.conf ./etc/telegraf/telegraf.conf
COPY srcs/ssh_host_rsa_key .
COPY srcs/ssh_host_dsa_key .
COPY srcs/sshd_config .
COPY srcs/nginx.conf ./root/
COPY srcs/setup.sh .

RUN chmod +x setup.sh

EXPOSE 80 443 22

CMD ./setup.sh
