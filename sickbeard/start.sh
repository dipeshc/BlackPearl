#!/bin/bash

if [ -n "$TRANSMISSION_PORT" ]
then
	python /var/sickbeard/sickbeardConfigInjector.py /var/sickbeard/config.ini torrent_host \"$TRANSMISSION_PORT\" > /var/sickbeard/config.ini.tmp
	mv config.ini.tmp config.ini
fi

cd /opt/sickbeard && python SickBeard.py --datadir=/var/sickbeard