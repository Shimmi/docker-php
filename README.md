# PHP fpm & zts
## Supported tags and respective `Dockerfile` links
* `7.2-rc-fpm` [(7.2-rc/fpm/Dockerfile)](https://github.com/Shimmi/docker-php/blob/master/7.2-rc/fpm/Dockerfile)
* `7.2-rc-zts` [(7.2-rc/zts/Dockerfile)](https://github.com/Shimmi/docker-php/blob/master/7.2-rc/zts/Dockerfile)
* `7.1-fpm`, `7-fpm`, `latest` [(7.1/fpm/Dockerfile)](https://github.com/Shimmi/docker-php/blob/master/7.1/fpm/Dockerfile)
* `7.1-zts` [(7.1/zts/Dockerfile)](https://github.com/Shimmi/docker-php/blob/master/7.1/zts/Dockerfile)
* `5.6-fpm`, `5-fpm` [(5.6/fpm/Dockerfile)](https://github.com/Shimmi/docker-php/blob/master/5.6/fpm/Dockerfile)

[![dockeri.co](http://dockeri.co/image/shimmi/php)](https://registry.hub.docker.com/shimmi/php/)

[![](https://images.microbadger.com/badges/image/shimmi/php.svg)](https://microbadger.com/images/shimmi/php "Get your own image badge on microbadger.com")
[![](https://images.microbadger.com/badges/version/shimmi/php.svg)](https://microbadger.com/images/shimmi/php "Get your own version badge on microbadger.com")
[![GitHub issues](https://img.shields.io/github/issues/shimmi/docker-php.svg "GitHub issues")](https://github.com/docker-php)
[![GitHub stars](https://img.shields.io/github/stars/shimmi/docker-php.svg "GitHub stars")](https://github.com/docker-php)

Based on the [Official PHP Docker image](https://store.docker.com/images/9c2c5426-0cca-4a30-a450-b2961541c6dc "official image").
This image adds some extensions that are necessary in most common use cases for running PHP projects.

## Changelog
Please refer to the repo's Wiki to see the [changelog](https://github.com/Shimmi/docker-php/wiki/Changelog).

## PHP7.1 ZTS threads notice
The _pthreads_ library dropped support for PHP 7.1. Due to memory leaks in PHP 7.0 and 7.1
they started requiring PHP 7.2. The `shimmi/7.1-zts` image since version [v1.2.1](https://github.com/Shimmi/docker-php/tree/v1.2.1)
has locked _pthreads_ to the last commit suitable for PHP 7.1. You are "required" to
upgrade to PHP 7.2. You may try the `shimmi/7.2-rc-zts`, but please note it is a release candidate
and it shall not be used on production servers.
