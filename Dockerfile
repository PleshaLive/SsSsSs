FROM alpine:latest

# Установка зависимостей
RUN apk add --no-cache \
    nginx \
    nginx-mod-rtmp \
    ffmpeg \
    && mkdir -p /var/www/hls \
    && chmod 755 /var/www/hls

# Копирование конфигурации
COPY nginx.conf /etc/nginx/nginx.conf

# Загрузка модуля RTMP
RUN echo "load_module modules/ngx_rtmp_module.so;" > /etc/nginx/modules.conf

ENV PORT=8080
EXPOSE 8080 1935

CMD ["nginx", "-g", "daemon off;"]
