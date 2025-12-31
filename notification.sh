#!/bin/bash
# A service script executed when a service has failed.
for id in $(loginctl list-sessions -j | jq -r '.[] | .session') ; do
	if [[ $(loginctl show-session $id --property=Type) =~ (wayland|x11) ]] ; then 
		systemd-run --machine=$(loginctl show-session $id --property=Name --value)@.host --user \
		notify-send "$@"
	fi
done
