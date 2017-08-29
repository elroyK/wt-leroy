FROM eboraas/apache-php

#Pour Ubuntu 16.10 et supérieur, php7 est automatique installé, et les packages php5 ne seront pas pris en compte. Ce Dockerfile a donc été modifié en conséquences.

RUN apt-get -y update && apt-get -y upgrade \
    && apt-get -y install php-mysql php-curl php-dev php-pear \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80
EXPOSE 8080
EXPOSE 443

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
