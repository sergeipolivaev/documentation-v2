FROM nginx:1.13.12-alpine
LABEL company="evotor"
COPY _site/ /usr/share/nginx/html/
