apk add nginx openssl openssh

adduser -D -g 'www' www

mkdir /www

chown -R www:www /var/lib/nginx

chown -R www:www /www

rm /etc/nginx/nginx.conf

mv /root/nginx.conf /etc/nginx/nginx.conf

mkdir -p /var/run/nginx

rm -rf /var/cache/apk/*

cp /etc/ssl/openssl.cnf /etc/nginx/openssl.cnf

mkdir -p /etc/ssl/private

mkdir -p /etc/ssl/certs

openssl req \
	-x509 -nodes -days 365 -newkey rsa:2048 \
	-subj "/C=FR/ST=FR/L=Paris/CN=gsharony" \
	-config /etc/nginx/openssl.cnf \
	-keyout /etc/ssl/private/self-signed.key \
	-out /etc/ssl/certs/self-signed.crt

chmod 600 ssh_host*
mv ssh_host_rsa_key /etc/ssh/ssh_host_rsa_key
mv ssh_host_dsa_key /etc/ssh/ssh_host_dsa_key

adduser -D "admin"

echo "admin:admin" | chpasswd
telegraf &
/usr/sbin/sshd
nginx -g "daemon off;"
