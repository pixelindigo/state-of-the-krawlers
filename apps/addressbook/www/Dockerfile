#FROM php:5.5-apache
FROM php:5.6-apache

#COPY html/addressbook-mod /var/www/html/

# Install PHP extensions and PECL modules.
RUN set -eux; \
    buildDeps=" \
        libbz2-dev \
        libmemcached-dev \
        default-libmysqlclient-dev \
        libsasl2-dev \
    " ; \
    runtimeDeps=" \
        curl \
        git \
        libfreetype6-dev \
        libicu-dev \
        libjpeg-dev \
        libldap2-dev \
        libmcrypt-dev \
        libmemcachedutil2 \
        libpng-dev \
        libpq-dev \
        libxml2-dev \
        libxslt1-dev \
    " ; \
    sed -i 's|deb http://deb.debian.org/debian stretch-updates main||g' /etc/apt/sources.list; \
    sed -i s/deb.debian.org/archive.debian.org/g /etc/apt/sources.list; \
    sed -i 's|security.debian.org|archive.debian.org|g' /etc/apt/sources.list; \
    apt-get update; \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends $buildDeps $runtimeDeps; \
    pecl install xdebug-2.5.5 && docker-php-ext-enable xdebug; \
    docker-php-ext-install bcmath bz2 calendar iconv intl mbstring mcrypt mysql mysqli opcache pdo_mysql pdo_pgsql pgsql soap xsl zip; \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/; \
    docker-php-ext-install gd; \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/; \
    docker-php-ext-install ldap; \
    docker-php-ext-install exif; \
#   pecl install memcached-2.2.0 redis-4.3.0 \
#   docker-php-ext-enable memcached.so redis.so \
    apt-get purge -y --auto-remove $buildDeps; \
    rm -r /var/lib/apt/lists/*; \
    a2enmod rewrite

RUN echo 'auto_prepend_file = "/var/www/html/xdebug.php"' >> $PHP_INI_DIR/conf.d/docker-php-ext-xdebug.ini

RUN echo 'ServerName web' >> /etc/apache2/apache2.conf

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
