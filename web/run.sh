#!/usr/bin/env bash

docker run -itd --name web \
 --net intern --ip 10.20.30.50 \
 -v /home/chris/wt_leroy/web/www:/var/www \
 -v /home/chris/wt_leroy/web/etc:/etc/apache2 \
 -v /home/chris/wt_leroy/web/log:/var/log/apache2 \
 -v /home/chris/wt_leroy/web/ssl:/etc/ssl \
 chris/web
