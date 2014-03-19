#!/bin/bash

if [ -n "$TRANSMISSION_PORT" ]
then
	python /var/couchpotato/couchpotatoConfigInjector.py /var/couchpotato/settings.conf transmission host "$TRANSMISSION_PORT_80_TCP_ADDR:$TRANSMISSION_PORT_80_TCP_PORT" > /var/couchpotato/settings.conf.tmp
	mv /var/couchpotato/settings.conf.tmp /var/couchpotato/settings.conf
fi

cd /opt/couchpotato && python /opt/couchpotato/CouchPotato.py --data_dir /var/couchpotato