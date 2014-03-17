#!/bin/bash

if [ -n $PLEX_PORT ]
then
	echo "PLEX_PORT detected in environment setting nginx upstream."
	echo "upstream plex { server $PLEX_PORT_32400_TCP_ADDR:$PLEX_PORT_32400_TCP_PORT; }" > /etc/nginx/conf.d/plex.conf
fi

if [ -n $TRANSMISSION_PORT ]
then
	echo "TRANSMISSION_PORT detected in environment setting nginx upstream."
	echo "upstream transmission { server $TRANSMISSION_PORT_80_TCP_ADDR:$TRANSMISSION_PORT_80_TCP_PORT; }" > /etc/nginx/conf.d/transmission.conf
fi

if [ -n $SICKBEARD_PORT ]
then
	echo "SICKBEARD_PORT detected in environment setting nginx upstream."
	echo "upstream sickbeard { server $SICKBEARD_PORT_80_TCP_ADDR:$SICKBEARD_PORT_80_TCP_PORT; }" > /etc/nginx/conf.d/sickbeard.conf
fi

cp /var/nginx/nginx.conf /etc/nginx/nginx.conf
service nginx start