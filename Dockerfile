FROM nginx
LABEL maintainer="ivannikita@gmail.com"

RUN ["mkdir", "/var/www/"]
COPY ./app /var/www/
COPY ./nginx.conf /etc/nginx/conf.d/default.conf
