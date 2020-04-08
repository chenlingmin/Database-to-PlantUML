FROM php:7.3-alpine3.9

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
RUN docker-php-ext-install pdo_mysql

WORKDIR /var/www/html
USER www-data
RUN wget https://codeload.github.com/chenlingmin/Database-to-PlantUML/zip/master -O /var/www/html/Database-to-PlantUML-master.zip \
  && unzip Database-to-PlantUML-master.zip -d /var/www/html/ \
  && mv Database-to-PlantUML-master/* ./ \
  && rm -rf Database-to-PlantUML-master.zip Database-to-PlantUML-master .git resource
  && composer install

ENTRYPOINT ["bin/database-to-plantuml"]
