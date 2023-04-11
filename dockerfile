# Use an official PHP runtime as a parent image
FROM php:7.4-apache

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages and dependencies
RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip

# Install any PHP extensions required by your app
RUN docker-php-ext-install pdo_mysql

# Expose port 80 for Apache
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
