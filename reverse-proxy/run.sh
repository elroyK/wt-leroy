#!/usr/bin/env bash

docker run -it --name reverse-proxy \
 --network intern --ip 10.20.30.100 \
 -p 80:80 -p 8080:8080 -p 443:443 -p 3306:3306 \
 -v /home/chris/wt_leroy/reverse-proxy/etc:/etc/nginx \
 -v /home/chris/wt_leroy/reverse-proxy/log:/var/log/nginx \
 -v /home/chris/wt_leroy/reverse-proxy/www:/var/www \
 -v /home/chris/wt_leroy/reverse-proxy/auth:/auth \
 nginx:latest 
