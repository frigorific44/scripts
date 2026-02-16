#!/bin/sh

APP_ID=$(swaymsg -rt get_tree | jq -r 'recurse(.nodes[]) | select(.focused) | .app_id')
NAME=$(swaymsg -rt get_tree | jq -r 'recurse(.nodes[]) | select(.focused) | .name')
notification.sh "$APP_ID" "$NAME"
