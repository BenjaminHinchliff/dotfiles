#!/usr/bin/bash

status=$(</sys/class/power_supply/BAT1/status)
capacity=$(</sys/class/power_supply/BAT1/capacity)

if [ "$status" = "Charging" ]; then
  if ((capacity >= 90 )); then
    echo "󰂅"
  elif ((capacity >= 80)); then
    echo "󰂋"
  elif ((capacity >= 70)); then
    echo "󰂊"
  elif ((capacity >= 60)); then
    echo "󰢞"
  elif ((capacity >= 50)); then
    echo "󰂉"
  elif ((capacity >= 40)); then
    echo "󰢝"
  elif ((capacity >= 30)); then
    echo "󰂇"
  elif ((capacity >= 20)); then
    echo "󰂇"
  elif ((capacity >= 10)); then
    echo "󰂆"
  elif ((capacity >= 0)); then
    echo "󰢜"
  fi
else
  if ((capacity >= 90 )); then
    echo "󰁹"
  elif ((capacity >= 80)); then
    echo "󰂂"
  elif ((capacity >= 70)); then
    echo "󰂁"
  elif ((capacity >= 60)); then
    echo "󰂀"
  elif ((capacity >= 50)); then
    echo "󰁿"
  elif ((capacity >= 40)); then
    echo "󰁾"
  elif ((capacity >= 30)); then
    echo "󰁽"
  elif ((capacity >= 20)); then
    echo "󰁼"
  elif ((capacity >= 10)); then
    echo "󰁻"
  elif ((capacity >= 0)); then
    echo "󰁺"
  fi
fi
