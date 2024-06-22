FROM php:5.6-apache

RUN pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug \
    && docker-php-ext-install mysql \ 
    && echo 'ServerName web' >> /etc/apache2/apache2.conf \
    && echo 'auto_prepend_file = "/var/www/html/xdebug.php"' >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

COPY src /var/www/html

COPY xdebug.php /var/www/html/xdebug.php

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
