FROM composer:2.8.12 as composer

WORKDIR /app
COPY composer.json ./
RUN composer install --no-interaction --no-dev --optimize-autoloader

FROM php:8.2-apache AS build

WORKDIR /var/www/html
COPY . .
COPY --from=composer /app/vendor ./vendor


FROM composer:2.8.12 AS test
WORKDIR /app
COPY composer.json ./
RUN composer install --no-interaction --optimize-autoloader
COPY . .
RUN ./vendor/bin/phpunit --configuration phpunit.xml