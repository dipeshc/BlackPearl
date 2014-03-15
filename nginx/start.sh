#!/bin/bash

echo "TRANSMISSION_PORT"
if [ -n $TRANSMISSION_PORT ]
then
	echo "1"
	echo "upstream transmission { server $TRANSMISSION_PORT_80_TCP_ADDR:$TRANSMISSION_PORT_80_TCP_PORT; }" > /etc/nginx/conf.d/transmission.conf
fi

echo "SICBEARD_PORT"
if [ -n $SICBEARD_PORT ]
then
	echo "2"
	echo "upstream sickbeard { server $SICBEARD_PORT_80_TCP_ADDR:$SICBEARD_PORT_80_TCP_PORT; }" > /etc/nginx/conf.d/sickbeard.conf
fi

cp /var/nginx/nginx.conf /etc/nginx/nginx.conf
service nginx start