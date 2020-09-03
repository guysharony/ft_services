FROM alpine:latest

RUN apk add --no-cache --upgrade bash wget influxdb
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz \
&& tar -zxf telegraf-1.15.2_linux_amd64.tar.gz \
&& cp -rf telegraf-1.15.2/etc/* /etc/ && cp -rf telegraf-1.15.2/usr/* /usr/ \
&& mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

COPY ./srcs/setup.sh .

RUN chmod +x ./setup.sh

EXPOSE 8086

CMD ./setup.sh
