FROM php:7.4-fpm-alpine

# Copy composer.lock and composer.json
#COPY composer.lock composer.json /application/

# Set working directory
WORKDIR /application

USER root

# Install Additional dependencies
RUN apk update && apk add --no-cache \
    build-base shadow vim curl \
    php7 \
    php7-fpm \
    php7-common \
    php7-pdo \
    php7-pdo_mysql \
    php7-mysqli \
    php7-mcrypt \
    php7-pgsql \
    php7-mbstring \
    php7-xml \
    php7-openssl \
    php7-json \
    php7-phar \
    php7-zip \
    php7-gd \
    php7-dom \
    php7-session \
    php7-zlib \
    libzip-dev \
    libpng-dev \
    libxml2-dev


# Install composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Add and Enable PHP-PDO Extenstions
RUN set -ex && apk  add mysql-dev
RUN docker-php-ext-install pdo pdo_mysql mysqli
RUN docker-php-ext-enable pdo_mysql
RUN docker-php-ext-install gd
RUN docker-php-ext-install xml

RUN set -ex && apk --no-cache add postgresql-dev
RUN docker-php-ext-install pdo pdo_pgsql
RUN docker-php-ext-enable pdo_pgsql

RUN docker-php-ext-configure zip
RUN docker-php-ext-install zip

# Remove Cache
RUN rm -rf /var/cache/apk/*

# Add UID '1000' to www-data
RUN usermod -u 1000 www-data

# Copy existing application directory permissions
COPY --chown=www-data:www-data . /application

# Change current user to www
USER www-data

# Expose port 9000 and start php-fpm server
EXPOSE 9000
CMD ["php-fpm"]

