FROM geoffreyplitt/docker-sickbeard
MAINTAINER Dipesh Chauhan dipesh@chauhan.net.au

RUN apt-get install -y curl
RUN curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python
RUN mv my-sickbeard-install /opt/sickbeard
RUN cd /opt/sickbeard && git remote set-url origin git://github.com/junalmeida/Sick-Beard.git
RUN cd /opt/sickbeard && git fetch
RUN cd /opt/sickbeard && git checkout -t origin/torrent_1080_subtitles
RUN cd /opt/sickbeard && git clean -xfd
RUN mkdir /var/sickbeard
RUN mkdir /media/tv
RUN mkdir /media/downloads

ENTRYPOINT cd /opt/sickbeard && python SickBeard.py --datadir=/var/sickbeard

EXPOSE 8081