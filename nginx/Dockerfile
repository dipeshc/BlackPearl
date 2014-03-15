FROM ubuntu
MAINTAINER Dipesh Chauhan dipesh@chauhan.net.au

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN apt-get -y install nginx
RUN echo "daemon off;" >> /etc/nginx/nginx.conf

ENTRYPOINT /var/nginx/start.sh

EXPOSE 80 443