#!/bin/bash
rm -rf app public themes vendor .editorconfig .htaccess composer.json composer.lock phpcs.xml.dist web.config && \
docker run -d --name web-temp brettt89/silverstripe-web:latest && \
# Get composer
docker exec -ti web-temp sh -c "curl -s https://getcomposer.org/installer | php"
docker exec -ti web-temp sh -c "chmod a+x ./composer.phar && ./composer.phar create-project silverstripe/installer /var/www/html/tmp" && \
docker cp web-temp:/var/www/html/tmp/. .
docker cp web-temp:/var/www/html/composer.phar .
docker stop web-temp && docker rm web-temp
docker-compose build && \
docker-compose up -d
rm -f composer.phar
