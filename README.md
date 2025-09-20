# RTMP → HLS server on Railway

## Как использовать

### Локально
1. Собрать и запустить:
   ```
   docker compose up --build
   ```
2. Из vMix стримить сюда:
   ```
   rtmp://localhost/live/streamkey
   ```
3. Смотреть в VLC:
   ```
   http://localhost:8080/hls/streamkey.m3u8
   ```

### На Railway
- Деплой этого репозитория (Dockerfile).
- vMix push:
  ```
  rtmp://sss-production-89e5.up.railway.app/live/streamkey
  ```
- VLC playback:
  ```
  http://sss-production-89e5.up.railway.app/hls/streamkey.m3u8
  ```
- Healthcheck:
  ```
  http://sss-production-89e5.up.railway.app/healthz
  ```

### Важно
- В vMix использовать кодеки H.264 (видео) и AAC (аудио).
- Задержка: 6–12 секунд из-за HLS.
