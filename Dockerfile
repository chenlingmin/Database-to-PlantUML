FROM php:7.3-alpine3.9

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN docker-php-ext-install pdo_mysql

WORKDIR /var/www/html
USER www-data
RUN wget https://codeload.github.com/chenlingmin/Database-to-PlantUML/zip/master -P /var/www/html \
  && unzip Database-to-PlantUML-master.zip -d /var/www/html \
  && rm -rf Database-to-PlantUML-master.zip .git resource

ENTRYPOINT ["bin/database-to-plantuml"]
