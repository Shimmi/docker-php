FROM php:7.0-fpm

MAINTAINER Jiří Šimeček <jirka@simecek.org>

# Extensions
RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	zlib1g-dev \
	libpng12-dev \
	libssl-dev \
	libmemcached-dev \
	wget

RUN pecl install mongodb \
    && pecl install redis \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install zip \
    && docker-php-ext-install -j$(nproc) iconv mcrypt \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-enable opcache \
    && docker-php-ext-enable mongodb \
    && docker-php-ext-enable redis

# Composer
RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && chmod +x composer.phar \
    && mv composer.phar /usr/bin/composer

# Add global composer bin dir to PATH
ENV PATH /root/.composer/vendor/bin:$PATH

VOLUME /srv

WORKDIR /srv
