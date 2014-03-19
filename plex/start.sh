#! /bin/sh

rm -f "/var/plex/Library/Application Support/Plex Media Server/plexmediaserver.pid"

mkdir -p /var/run/dbus
chown messagebus:messagebus /var/run/dbus
dbus-uuidgen --ensure
dbus-daemon --system --fork
sleep 2

avahi-daemon -D
sleep 2

HOME=/var/plex
start_pms