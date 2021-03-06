#!/bin/bash

echo -e 'events {' >> nginx.conf
echo -e ' \t ' 'worker_connections  1024;' >> nginx.conf
echo -e '}\n' >> nginx.conf


printf 'Enter your desired local domain : '
read -r domain
printf 'Enter your local IP Address : '
read -r ip
printf 'Enter the Port Number : '
read -r port 



echo 'http {' >> nginx.conf
echo -e ' \t ' 'server {' >> nginx.conf
echo -e ' \t \t' 'listen       80;' >> nginx.conf
echo -e ' \t \t' 'server_name' "$domain" ';\n' >> nginx.conf
echo -e ' \t \t' 'location / {' >> nginx.conf
echo -e ' \t \t \t' 'proxy_pass http://'"$ip"':'"$port"';' >> nginx.conf
echo -e ' \t \t' '}' >> nginx.conf
echo -e ' \t' '}' >> nginx.conf
echo '}' >> nginx.conf

echo -e "$ip"  '\t'   "$domain" >> /etc/hosts
