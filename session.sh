#!/bin/bash

session_path="$1"

# Projects
if [[ "${session_path}" =~ ^$HOME/projects ]] && [ -d "$session_path" ]; then
  echo "Projects"
  (kitty -d "$session_path" helix >/dev/null 2>&1 &)
  sleep 0.1
  swaymsg splith
  (kitty -d "$session_path" gitui >/dev/null 2>&1 &)
  sleep 0.1
  swaymsg splitv
  (kitty -d "$session_path" >/dev/null 2>&1 &)
# Anki Language Learning
elif [[ "${session_path,,}" =~ /(video|videos|movie|movies)/ ]]; then
  echo "Anki"
  swaymsg splitv
  (anki >/dev/null 2>&1 &)
  sleep 2
  swaymsg splith
  (xdg-open "$session_path" >/dev/null 2>&1 &)
  sleep 2
  swaymsg splitv
  (kitty >/dev/null 2>&1 &)
fi

exit
