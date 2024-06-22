FROM bitnami/owncloud-archived:10.10.0

COPY docker-php-ext-enable /usr/bin/

ENV PHP_INI_DIR=/opt/bitnami/php/etc/

RUN apt update && apt install -y autoconf gcc make \
    && pecl install xdebug-3.1.3 \
    && chmod +x /usr/bin/docker-php-ext-enable \
    && docker-php-ext-enable xdebug \
    && echo $'auto_prepend_file = "/opt/xdebug.php"\nxdebug.mode = "coverage"' >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

COPY xdebug.php /opt/xdebug.php
