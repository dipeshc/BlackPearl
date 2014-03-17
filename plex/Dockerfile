FROM ubuntu
MAINTAINER Dipesh Chauhan dipesh@chauhan.net.au

RUN apt-get update
RUN apt-get install -y curl
RUN echo "deb http://shell.ninthgate.se/packages/debian squeeze main" > /etc/apt/sources.list.d/plexmediaserver.list
RUN curl http://shell.ninthgate.se/packages/shell-ninthgate-se-keyring.key | apt-key add -
RUN apt-get update
RUN apt-get install -y plexmediaserver

ENTRYPOINT /var/plex/start.sh