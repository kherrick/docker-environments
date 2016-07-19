FROM php:7.0.8-fpm-alpine
MAINTAINER Karl Herrick <me@karlherrick.com>

WORKDIR /tmp/
ENV HOME /root

# Add xdebug from edge
RUN echo "@testing http://dl-2.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories
RUN apk --update add php7-xdebug@testing
RUN apk add php7-gd@testing

COPY config/15-xdebug.ini /usr/local/etc/php/conf.d/15-xdebug.ini
copy config/20-gd.ini /usr/local/etc/php/conf.d/20-gd.ini
COPY config/php.ini /usr/local/etc/php/php.ini

EXPOSE 9000

CMD ["php-fpm"]
