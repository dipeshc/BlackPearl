FROM ubuntu
MAINTAINER Dipesh Chauhan dipesh@chauhan.net.au

RUN apt-get install -y wget
RUN apt-get install -y libssl0.9.8:i386
RUN wget -O- http://download.utorrent.com/linux/utorrent-server-3.0-25053.tar.gz | tar zxf - -C /opt
RUN mv /opt/utorrent-server-v3_0 /opt/utorrent
RUN mkdir /var/utorrent

ENTRYPOINT cd /opt/utorrent && ./utserver -settingspath /opt/utorrent/ -configfile /var/utorrent/config.ini

EXPOSE 6881
EXPOSE 8080
