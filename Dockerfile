FROM ubuntu:latest
RUN apt-get update && apt-get install -y nginx
WORKDIR /app
COPY . .
CMD [ "nginx", "-g", "daemon off;" ]