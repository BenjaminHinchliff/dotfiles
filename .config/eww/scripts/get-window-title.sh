#!/bin/sh
hyprctl activewindow -j | jq --raw-output .title
socat -u UNIX-CONNECT:"$XDG_RUNTIME_DIR"/hypr/"$HYPRLAND_INSTANCE_SIGNATURE"/.socket2.sock - | \
  stdbuf -o0 awk -F '>>|,' \
  '/^activewindow>>/{if (length($3) > 90) {print substr($3, 1, 44) "..." substr($3, length($3) - 43)} else {print $3}}'
