#!/bin/bash

# Переменные окружения
SERVER_USER="ваш-пользователь-на-сервере"
SERVER_IP="ваш-IP-сервера"
REMOTE_DIR="/путь/к/вашему/wordpress"

# Копирование файлов на сервер
rsync -avz --exclude '.git' --exclude '.github' . $SERVER_USER@$SERVER_IP:$REMOTE_DIR

# Обновление зависимостей и прав на сервере
ssh $SERVER_USER@$SERVER_IP << EOF
cd $REMOTE_DIR
composer install
chown -R www-data:www-data .
chmod -R 755 .
EOF

echo "Deployment finished successfully."
