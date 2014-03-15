#!/bin/bash

if [ -n $TRANSMISSION_PORT ]
then
	python /var/sickbeard/sickbeardConfigInjector.py /var/sickbeard/config.ini torrent_host \"$TRANSMISSION_PORT\"
fi

cd /opt/sickbeard && python SickBeard.py --datadir=/var/sickbeard