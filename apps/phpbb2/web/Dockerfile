#FROM php:5.3-apache
FROM php:5.6-apache
#xdebug needs < 7.2.0

ENV PHP_INI_SCAN_DIR=/usr/local/etc/php/conf.d

RUN set -eux; \
    sed -i 's|deb http://deb.debian.org/debian stretch-updates main||g' /etc/apt/sources.list; \
    sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list; \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list; \
    apt-get update; \
    apt-get install -y --no-install-recommends git; \
    #pecl install xdebug-2.2.7 \
    pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug; \
    docker-php-ext-install mysql mysqli pdo pdo_mysql; \
    rm -r /var/lib/apt/lists/*; \
    echo 'ServerName web' >> /etc/apache2/apache2.conf; \
    mkdir -p $PHP_INI_SCAN_DIR; \
    echo 'zend_extension="/usr/local/lib/php/extensions/no-debug-non-zts-20131226/xdebug.so"' >> $PHP_INI_SCAN_DIR/docker-php-ext-xdebug.ini; \
    echo 'auto_prepend_file = "/var/www/html/xdebug.php"' >> $PHP_INI_SCAN_DIR/docker-php-ext-xdebug.ini

RUN git clone https://github.com/phpbb/phpbb.git -b release-2.0.23 /tmp/phpbb \
    && mv /tmp/phpbb/phpBB/* /var/www/html/

RUN rm -rf /var/www/html/install /var/www/html/contrib
COPY xdebug.php config.php /var/www/html/

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]

