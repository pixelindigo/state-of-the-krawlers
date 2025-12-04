FROM php:7.1.33-apache
# xdebug needs < 7.2.0

RUN sed -i 's|deb.debian.org|archive.debian.org|g' /etc/apt/sources.list \
    && sed -i 's|security.debian.org|archive.debian.org/debian-security|g' /etc/apt/sources.list \
    && echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until \
    && apt-get update \
    && apt-get install -y git $PHPIZE_DEPS \
    && pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug \
    && docker-php-ext-install mysqli \
    && rm -r /var/lib/apt/lists/* \
    && echo 'ServerName web' >> /etc/apache2/apache2.conf \
    && echo 'auto_prepend_file = "/var/www/html/xdebug.php"' >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

RUN git clone https://github.com/kohler/hotcrp.git -b v2.102 /var/www/html

COPY xdebug.php /var/www/html/xdebug.php
COPY options.php /var/www/html/conf/options.php

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

