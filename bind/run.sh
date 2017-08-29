#!/usr/bin/env bash

docker run -itd --name bind \
 -p 54:54/udp -p 953:953 -p 10000:10000 \
 -e ROOT_PASSWORD="batte564" \
 -v /home/chris/wt_leroy/bind/data:/data \
 -v /home/chris/wt_leroy/bind/log:/var/log/bind \
 sameersbn/bind:latest
