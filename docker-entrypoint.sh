#!/usr/bin/env bash
echo "Installing plugins and setting up WordPress..."

wp core install --locale=ru_RU --url=localhost --title=TestSite --admin_user=admin --admin_email=test@gmail.com --admin_password=admin --allow-root

PLUGINS=(
    "advanced-custom-fields-pro-6_2_9.zip"
    "contact-form-7.5.9.4.zip"
    "show-current-template.0.5.2.zip"
    "query-monitor.3.16.2.zip"
    "hide-my-wp.5.2.02.zip"
    "limit-login-attempts-reloaded.2.26.11.zip"
    "blackhole-bad-bots.3.7.1.zip"
)

for PLUGIN in "${PLUGINS[@]}"; do
    wp plugin install "/var/www/html/install-plugins/$PLUGIN" --activate --allow-root
done

echo "Installation succeeded"
