FROM bitnami/wordpress:5.1.0

COPY docker-php-ext-enable /usr/bin/

ENV PHP_INI_DIR=/opt/bitnami/php/etc/

RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list \
    && sed -i 's|security.debian.org|archive.debian.org/debian-security/|g' /etc/apt/sources.list \ 
    && sed -i 's|httpredir.debian.org/debian|archive.debian.org/debian|g' /etc/apt/sources.list \ 
    && apt update && apt install -y autoconf gcc make \
    && pecl install xdebug-3.1.3 \
    && chmod +x /usr/bin/docker-php-ext-enable \
    && docker-php-ext-enable xdebug \
    && echo 'auto_prepend_file = "/opt/xdebug.php"\nxdebug.mode = "coverage"' >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

COPY xdebug.php /opt/xdebug.php
