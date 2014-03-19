FROM ubuntu
MAINTAINER Dipesh Chauhan dipesh@chauhan.net.au

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y git-core
RUN git clone git://github.com/RuudBurger/CouchPotatoServer.git /opt/couchpotato
RUN mkdir /var/couchpotato
RUN mkdir /media/movies
RUN mkdir /media/downloads

ENTRYPOINT /var/couchpotato/start.sh

EXPOSE 5050