# Sử dụng image PHP có Composer
FROM php:8.2-fpm

# Cài đặt các extension cần thiết
RUN apt-get update && apt-get install -y \
    zip unzip git curl libpq-dev libzip-dev \
    && docker-php-ext-install pdo pdo_mysql

# Cài đặt Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Đặt thư mục làm việc
WORKDIR /var/www

# Copy mã nguồn vào container
COPY . .

# Cài đặt Composer
RUN composer install --no-dev --optimize-autoloader

# Cấp quyền cho storage và bootstrap
RUN chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache

# Chạy ứng dụng
CMD ["php-fpm"]
