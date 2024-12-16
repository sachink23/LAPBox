#!/bin/bash

# Restore Apache configuration if missing
if [ ! -f /etc/apache2/apache2.conf ]; then
    echo "Restoring default Apache configuration..."
    cp -r /etc/apache2.bak/* /etc/apache2
fi

# Restore PHP configuration if missing
if [ ! -f /etc/php/8.3/apache2/php.ini ]; then
    echo "Restoring default PHP configuration..."
    cp -r /etc/php.bak/* /etc/php
fi

# Ensure web root exists
mkdir -p /var/www/html

# Fix ownership for web and config files
chown -R www-data:www-data /var/www
chown -R www-data:www-data /etc/apache2
chown -R www-data:www-data /etc/php

# Start Apache
apachectl -D FOREGROUND
