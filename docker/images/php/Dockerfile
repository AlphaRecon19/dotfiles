FROM php:7.2-cli-alpine

RUN apk add --no-cache \
        autoconf \
        binutils \
        curl-dev \
        freetype-dev \
        g++ \
        gcc \
        icu-dev\
        libcurl \
        libjpeg-turbo-dev \
        libmcrypt-dev \
        libpng-dev \
        libxml2-dev \
        make \
        postfix \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j "$(getconf _NPROCESSORS_ONLN)" \
        curl \
        exif \
        fileinfo \
        intl \
        gd \
        json \
        mbstring \
        pdo_mysql \
        posix \
        xml \
        zip \
    && docker-php-ext-install -j "$(getconf _NPROCESSORS_ONLN)" gd \
    && rm -rf /var/cache/apk/*


COPY php.ini /usr/local/etc/php/
