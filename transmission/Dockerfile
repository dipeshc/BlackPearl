FROM ubuntu
MAINTAINER Dipesh Chauhan dipesh@chauhan.net.au

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN apt-get -y install python-software-properties
RUN apt-get -y install transmission-daemon
RUN mkdir /var/transmission
RUN mkdir /media/downloads

ENTRYPOINT transmission-daemon --config-dir /var/transmission --foreground

EXPOSE 9091 51413