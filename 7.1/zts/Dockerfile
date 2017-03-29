FROM php:7.1-zts

MAINTAINER Jiří Šimeček <jirka@simecek.org>

COPY config/php.ini /usr/local/etc/php/

# Extensions
RUN apt-get update && apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    zlib1g-dev \
    libpng12-dev \
    libssl-dev \
    libmemcached-dev \
    wget \
    git

RUN pecl install \
        mongodb \
        redis \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) \
        gd \
        iconv \
        mcrypt \
        bcmath \
        mysqli \
        pcntl \
        pdo_mysql \
        zip \
        sockets \
    && docker-php-ext-enable \
        opcache \
        mongodb \
        redis

# Add PHP Pthreads module
# Since there is no official PECL release for PHP 7.1 yet, we need to install it from source
# Borowed from https://github.com/bscheshirwork/multispider/blob/master/zts/Dockerfile
RUN git clone https://github.com/krakjoe/pthreads.git \
        && ( \
            cd pthreads \
            && phpize \
            && ./configure --enable-pthreads \
            && make -j$(nproc) \
            && make install \
        ) \
        && rm -r pthreads \
        && docker-php-ext-enable pthreads

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
