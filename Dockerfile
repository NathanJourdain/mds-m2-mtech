FROM php:8.2-apache AS build

WORKDIR /var/www/html

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

RUN apt-get update && apt-get install -y git unzip zip && rm -rf /var/lib/apt/lists/*

COPY composer.json composer.lock* ./

RUN composer install --prefer-dist --no-progress --no-interaction

COPY . .

# Test stage
FROM build AS test

RUN composer install --dev && vendor/bin/phpunit --testdox --no-interaction || (echo "Tests failed" && exit 1)

EXPOSE 80