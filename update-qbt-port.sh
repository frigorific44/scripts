#!/bin/bash
# A script to track port changes and update
# the QBittorrent listening port, respectively.
# Intended use is as a callback for vopono.
OLD_PORT="$(curl "http://localhost:8080/api/v2/app/preferences" | jq '.listen_port')"
# echo "Current: $OLD_PORT"
if [[ "$OLD_PORT" != "$1" ]]; then
	curl "http://localhost:8080/api/v2/app/setPreferences" -d "json={\"listen_port\": $1}"
	echo "Port changed from $OLD_PORT to $1."
	/usr/local/bin/notification.sh 'QBittorrent Port Changed' "Port changed from $OLD_PORT to $1."
else
	echo "Port unchanged from $OLD_PORT."
fi
