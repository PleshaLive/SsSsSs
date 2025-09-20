FROM alpine:latest

# Установка зависимостей
RUN apk add --no-cache \
    nginx \
    nginx-mod-rtmp \
    ffmpeg \
    && mkdir -p /var/www/hls \
    && chmod 755 /var/www/hls

# Копирование конфигурации и скрипта запуска
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Загрузка модуля RTMP
RUN echo "load_module modules/ngx_rtmp_module.so;" > /etc/nginx/modules.conf

ENV PORT=8080
EXPOSE 8080 1935

CMD ["/start.sh"]
