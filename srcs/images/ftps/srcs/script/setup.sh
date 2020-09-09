apk upgrade
apk update
apk add wget openssl
apk add pure-ftpd.apk
openssl req -x509 -nodes -days 7300 -newkey rsa:2048 -subj "/C=FR/ST=FR/L=Paris/CN=gsharony" -keyout /etc/ssl/private/pure-ftpd.pem -out /etc/ssl/private/pure-ftpd.pem
chmod 744 /etc/ssl/private/pure-ftpd.pem
mkdir -p /ftps/$FTP_USER
adduser -h /ftps/$FTP_USER -D $FTP_USER
echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
openrc
touch /run/openrc/softlevel
rc-update add telegraf

/etc/init.d/telegraf start
pure-ftpd -j -Y 2 -p 21000:21000 -P "172.17.0.9"
