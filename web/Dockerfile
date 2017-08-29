FROM eboraas/apache-php

RUN apt-get -y update && apt-get -y upgrade \
    && apt-get -y install php-mysql php-curl php-dev php-pear \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 80
EXPOSE 8080
EXPOSE 443

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
