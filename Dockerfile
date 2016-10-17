FROM php:7-fpm

MAINTAINER Jiří Šimeček <jirka@simecek.org>

# Composer
RUN php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && chmod +x composer.phar \
    && mv composer.phar /usr/bin/composer

RUN apt-get update && apt-get install -y \
	libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
	zlib1g-dev \
	libpng12-dev \
	libssl-dev \
	wget \
	git \
	mc
RUN docker-php-ext-install mysqli \
	&& pecl install mongodb \
	&& docker-php-ext-install zip \
	&& docker-php-ext-enable mongodb 

RUN pear install PHP_CodeSniffer

WORKDIR /srv/www
	
EXPOSE 9000
