FROM adamdoupe/wackopicko

RUN set -eux; \
    sed -i 's|archive.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list || true; \
    sed -i 's|security.ubuntu.com|old-releases.ubuntu.com|g' /etc/apt/sources.list || true; \
    apt-get update; \
    apt-get install -y --no-install-recommends php-pear php5-dev; \
    pecl install xdebug-2.5.5; \
    rm -rf /var/lib/apt/lists/*
RUN echo 'auto_prepend_file = "/var/www/html/xdebug.php"' >> /etc/php5/apache2/conf.d/docker-php-ext-xdebug.ini \
        && echo $'\nzend_extension=/usr/lib/php5/20121212/xdebug.so' >> /etc/php5/apache2/php.ini

COPY xdebug.php /var/www/html/xdebug.php
