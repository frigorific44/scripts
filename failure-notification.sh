#!/bin/bash
# A service script executed when a service has failed.
/usr/local/bin/notification.sh 'systemd service failed' "The service $1 failed."
