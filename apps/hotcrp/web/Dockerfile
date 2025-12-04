FROM php:7.4-apache

RUN apt-get update -y \
    && apt-get install -y --no-install-recommends git curl \
    && pecl install xdebug-3.1.6 && docker-php-ext-enable xdebug \
    && docker-php-ext-install mysqli pdo_mysql \
    && rm -r /var/lib/apt/lists/* \
    && echo 'ServerName web' >> /etc/apache2/apache2.conf \
    && { \
        echo 'xdebug.mode = coverage'; \
        echo 'xdebug.start_with_request = yes'; \
        echo 'auto_prepend_file = "/var/www/html/xdebug.php"'; \
      } >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

RUN git clone https://github.com/kohler/hotcrp.git -b v2.102 /var/www/html

COPY xdebug.php /var/www/html/xdebug.php
COPY options.php /var/www/html/conf/options.php

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

