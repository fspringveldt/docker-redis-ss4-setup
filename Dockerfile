FROM brettt89/silverstripe-web:latest

# ENV DOCUMENT_ROOT /var/www/html
RUN pecl install -o -f redis \
&&  rm -rf /tmp/pear \
&&  docker-php-ext-enable redis

# COPY php.ini file
COPY docker/php/php.ini /usr/local/etc/php/
COPY . ${DOCUMENT_ROOT}
COPY docker/apache/000-default.conf /etc/apache2/sites-available/000-default.conf
WORKDIR ${DOCUMENT_ROOT}
EXPOSE 80
EXPOSE 443
RUN php ./composer.phar install
RUN chown -R www-data:www-data ${DOCUMENT_ROOT}/public
