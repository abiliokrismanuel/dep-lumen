FROM php:8.1-fpm-alpine

WORKDIR /var/www/html/

#install depedency
RUN apk update && apk add --no-cache \
    curl \
    libpng-dev \
    libzip-dev \
    zip \
    unzip

#RUN docker-php-ext-install pdo pdo_mysql

# Install PHP extensions
RUN docker-php-ext-install pdo_mysql gd zip

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
# ganti app ke nama folder project
COPY /App/ /var/www/html/

RUN composer install --no-dev

# Generate the app key
# RUN php artisan key:generate

# Run database migrations nanti kalo udah run containernya
#RUN php artisan migrate

RUN chmod -R 777 /var/www/html

EXPOSE 9000

CMD ["php-fpm"]
