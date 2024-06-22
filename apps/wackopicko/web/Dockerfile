FROM adamdoupe/wackopicko

RUN apt update && apt install -y php-pear php5-dev && pecl install xdebug-2.5.5
RUN echo 'auto_prepend_file = "/var/www/html/xdebug.php"' >> /etc/php5/apache2/conf.d/docker-php-ext-xdebug.ini \
        && echo $'\nzend_extension=/usr/lib/php5/20121212/xdebug.so' >> /etc/php5/apache2/php.ini

COPY xdebug.php /var/www/html/xdebug.php
