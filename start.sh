#!/bin/sh

# Заменяем ${PORT} на значение переменной окружения PORT
sed -i "s/\${PORT}/$PORT/g" /etc/nginx/nginx.conf

# Запускаем nginx
exec nginx -g "daemon off;"
