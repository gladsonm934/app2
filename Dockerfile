FROM nginx:alpine

COPY index.html /style.css /usr/share/nginx/html/css/

EXPOSE 80