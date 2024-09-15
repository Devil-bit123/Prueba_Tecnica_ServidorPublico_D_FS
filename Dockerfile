FROM richarvey/nginx-php-fpm:2.0.1

# Copiar archivos de la aplicación
COPY . /var/www/html/

# Exponer el puerto 80
EXPOSE 80

# Configuración de la imagen
ENV SKIP_COMPOSER 1
ENV WEBROOT /var/www/html/public
ENV PHP_ERRORS_STDERR 1
ENV RUN_SCRIPTS 1
ENV REAL_IP_HEADER 1

# Laravel config
ENV APP_ENV production
ENV APP_DEBUG false
ENV LOG_CHANNEL stderr

# Allow composer to run as root
ENV COMPOSER_ALLOW_SUPERUSER 1

# Instalar dependencias de Composer
RUN composer install --no-dev --optimize-autoloader --working-dir=/var/www/html

# Generar clave de la aplicación
RUN php /var/www/html/artisan key:generate

# Ejecutar migraciones de la base de datos
RUN php /var/www/html/artisan migrate --force

# Cachear configuraciones
RUN php /var/www/html/artisan config:cache

# Establecer permisos
RUN chown -R www-data:www-data /var/www/html/storage /var/www/html/bootstrap/cache

# Hacer ejecutable el archivo start.sh
RUN chmod +x /start.sh

# Iniciar NGINX y PHP-FPM
CMD ["/start.sh"]
