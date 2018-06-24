#!/bin/bash

# service php7.2-fpm start

# Force output to stderr in nodaemonize even if stderr is not a TTY
mkdir /run/php
php-fpm7.2 -O -R

# Nginx
nginx -g 'daemon off;'
