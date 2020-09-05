FROM nginx:latest

WORKDIR /app

COPY ./web/ /usr/share/nginx/html/    

EXPOSE 80
