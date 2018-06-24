FROM ubuntu:18.04

WORKDIR /data/wp

## Dependencies
RUN apt update && \
    apt upgrade -y && \
    apt install curl \
                vim \
                gnupg2 -y

## Nginx
RUN apt install nginx -y
COPY docker/nginx/default.conf /etc/nginx/conf.d/default.conf

## PHP 7.2
COPY docker/php/apt-ondrej-php.list /etc/apt/sources.list.d/ondrej-php-bionic.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4F4EA0AAE5267A6C
RUN apt update && \
    apt install php7.2-cli \
                php7.2-fpm \
                php7.2-mbstring \
                php7.2-mysql -y

RUN sed -i 's|listen = /run/php/php7.2-fpm.sock|listen = 127.0.0.1:9000|g' /etc/php/7.2/fpm/pool.d/www.conf
RUN sed -i 's|;clear_env =.*|clear_env = no|g' /etc/php/7.2/fpm/pool.d/www.conf

## Wordpress
ENV WP_VER 4.9.6
ENV WP_SHA1 40616b40d120c97205e5852c03096115c2fca537

RUN curl https://wordpress.org/wordpress-4.9.6.tar.gz -o /tmp/wordpress.tar.gz && \
    echo "$WP_SHA1 /tmp/wordpress.tar.gz" | sha1sum -c - && \
    tar -zxvf /tmp/wordpress.tar.gz -C /data/wp --strip-components=1 && \
    rm /tmp/wordpress.tar.gz

COPY docker/wp/wp-config.php /data/wp/wp-config.php

#COPY wp-content /data/wordpress/wp-content
# Only allow Nginx/PHP to write to a specific cache folder | or don't even need this
#RUN chown www-data: /data/wordpress/wp-content/cache


ADD . .
CMD ./start.sh