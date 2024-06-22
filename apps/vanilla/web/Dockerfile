#FROM php:7.1.33-apache
FROM php:5.6-apache
#xdebug 2.5.5 needs < 7.2.0

RUN sed -i 's|deb http://deb.debian.org/debian stretch-updates main||g' /etc/apt/sources.list \ 
    && sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list \
    && sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list \ 
    && apt update && apt install -y git \
    && pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug \
    && docker-php-ext-install mysqli \ 
    && docker-php-ext-install pdo_mysql \ 
    && rm -r /var/lib/apt/lists/* \
    && echo 'ServerName web' >> /etc/apache2/apache2.conf \
    && echo 'auto_prepend_file = "/var/www/html/xdebug.php"' >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

COPY src/ /var/www/html

RUN chmod -R 777 /var/www/html/conf /var/www/html/cache /var/www/html/uploads

COPY config.php /var/www/html/conf/config.php
COPY xdebug.php /var/www/html/xdebug.php
#RUN echo '<?php ?>' > /var/www/html/xdebug.php

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

