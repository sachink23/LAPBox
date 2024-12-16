FROM ubuntu:24.04

LABEL version="0.1" \
      name="LAPBox" \
      description="A lightweight Docker image for running PHP applications with Apache"
      
# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install required packages
RUN apt-get update && apt-get install -y \
    apache2 \
    php \
    php-cli \
    php-mysql \
    php-pdo \
    php-zip \
    php-uuid \
    php-mbstring \
    php-json \
    php-curl \
    php-xml \
    php-gd \
    php-intl \
    php-exif \
    php-fileinfo \
    php-ftp \
    php-sockets \
    php-igbinary \
    php-imagick \
    libapache2-mod-php \
    unzip \
    zip \
    curl \
    nano \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod rewrite ssl headers

# Backup default Apache and PHP configuration
RUN mkdir -p /etc/apache2.bak /etc/php.bak && \
    cp -r /etc/apache2/* /etc/apache2.bak/ && \
    cp -r /etc/php/* /etc/php.bak/ && \
    mkdir -p /var/www/html && \
    chown -R www-data:www-data /etc/apache2 /etc/php /var/www

# Add entrypoint script
COPY scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Use the entrypoint script
ENTRYPOINT ["entrypoint.sh"]

# Expose mountable configuration and log directories
VOLUME ["/etc/apache2", "/var/log/apache2", "/var/www", "/etc/php/"]

# Set working directory
WORKDIR /var/www/

# Expose ports
EXPOSE 80 443