FROM geoffreyplitt/docker-sickbeard
RUN apt-get install -y curl
RUN curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python
RUN mv my-sickbeard-install sickbeard
RUN cd sickbeard && git remote set-url origin git://github.com/junalmeida/Sick-Beard.git
RUN cd sickbeard && git fetch
RUN cd sickbeard && git checkout -t origin/torrent_1080_subtitles
RUN cd sickbeard && git clean -xfd
RUN mkdir sickbeard-data
ENTRYPOINT cd sickbeard && python SickBeard.py --datadir=/sickbeard-data
EXPOSE 8081
