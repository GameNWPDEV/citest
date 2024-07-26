FROM wordpress:latest

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x /usr/local/bin/wp \
    && wp --info

COPY docker-entrypoint.sh /var/www/html/install-docker.sh
COPY plugins /var/www/html/install-plugins

RUN chown -R www-data:www-data /var/www/html /var/www/html/install-docker.sh /var/www/html/install-plugins \
    && chmod +x /var/www/html/install-docker.sh

EXPOSE 80
CMD ["apache2-foreground"]
