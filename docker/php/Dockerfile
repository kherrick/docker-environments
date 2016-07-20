FROM php:7.0.8-fpm-alpine
MAINTAINER Karl Herrick <me@karlherrick.com>

WORKDIR /tmp/
ENV HOME /root

# Add xdebug from edge/testing
RUN echo "@testing http://dl-2.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk --update add php7-xdebug@testing
RUN apk add php7-gd@testing

# Work around some permissions issues on Linux
RUN sed -i 's/user = www-data/user = root/g' /usr/local/etc/php-fpm.d/www.conf
RUN sed -i 's/group = www-data/group = root/g' /usr/local/etc/php-fpm.d/www.conf

# Copy configs
COPY config/15-xdebug.ini /usr/local/etc/php/conf.d/15-xdebug.ini
COPY config/20-gd.ini /usr/local/etc/php/conf.d/20-gd.ini
COPY config/php.ini /usr/local/etc/php/php.ini

EXPOSE 9000

# Allow PHP-FPM to run as root
CMD ["php-fpm", "-R"]
