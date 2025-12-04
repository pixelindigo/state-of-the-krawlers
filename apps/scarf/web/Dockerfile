FROM php:5.6-apache

RUN sed -i 's|deb http://deb.debian.org/debian stretch-updates main||g' /etc/apt/sources.list \
    && sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list \
    && sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y $PHPIZE_DEPS \
    && pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug \
    && docker-php-ext-install mysql \
    && rm -r /var/lib/apt/lists/* \
    && echo 'ServerName web' >> /etc/apache2/apache2.conf \
    && echo 'auto_prepend_file = "/var/www/html/xdebug.php"' >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

COPY src /var/www/html

COPY xdebug.php /var/www/html/xdebug.php

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
