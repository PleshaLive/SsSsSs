FROM nginx:alpine

RUN apk add --no-cache ffmpeg

COPY nginx.conf /etc/nginx/nginx.conf

ENV PORT=8080
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
