#!/usr/bin/env bash

docker run -itd --name bind \
 -p 54:54/udp -p 953:953 -p 10000:10000 \ #changer 53 en 54 sur Ubuntu 17.04+, 53 étant pris par l'OS
 -e ROOT_PASSWORD="wtadmin2018" \
 -v /home/chris/wt-leroy/bind/data:/data \
 -v /home/chris/wt-leroy/bind/log:/var/log/bind \
 sameersbn/bind:latest
