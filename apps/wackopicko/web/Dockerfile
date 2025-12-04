FROM adamdoupe/wackopicko

RUN sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list \
    && sed -i 's|security.debian.org|archive.debian.org/debian-security|g' /etc/apt/sources.list \
    && echo 'Acquire::Check-Valid-Until "false";' > /etc/apt/apt.conf.d/99no-check-valid-until \
    && apt-get update \
    && apt-get install -y php-pear php5-dev build-essential autoconf \
    && pecl install xdebug-2.5.5

RUN echo 'auto_prepend_file = "/var/www/html/xdebug.php"' >> /etc/php5/apache2/conf.d/docker-php-ext-xdebug.ini \
        && echo $'\nzend_extension=/usr/lib/php5/20121212/xdebug.so' >> /etc/php5/apache2/php.ini

COPY xdebug.php /var/www/html/xdebug.php
