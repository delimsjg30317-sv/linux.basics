FROM nginx:alpine

# Nginx 기본 설정 덮어쓰기
COPY default.conf /etc/nginx/conf.d/default.conf
COPY html /usr/share/nginx/html

EXPOSE 80