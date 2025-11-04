FROM php:8.2-cli

WORKDIR /app

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

COPY composer.json composer.lock* ./

RUN composer install --prefer-dist --no-progress --no-interaction

COPY . .

CMD ["vendor/bin/phpunit"]
