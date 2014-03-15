FROM ubuntu
MAINTAINER Dipesh Chauhan dipesh@chauhan.net.au

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade
RUN apt-get install -y curl git-core python-cheetah
RUN curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python
RUN git clone git://github.com/junalmeida/Sick-Beard.git /opt/sickbeard -b torrent_1080_subtitles
RUN mkdir /var/sickbeard
RUN mkdir /media/tv
RUN mkdir /media/downloads

ENTRYPOINT /var/sickbeard/start.sh

EXPOSE 8081