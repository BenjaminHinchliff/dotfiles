#!/bin/bash

monitors=$(hyprctl monitors -j)

jq -c '.[]' <<<"$monitors" | while read -r monitor; do
  id=$(jq '.id' <<<"$monitor")
  width=$(jq '.width' <<<"$monitor")
  scale=$(jq '.scale' <<<"$monitor")
  scaledwidth=$(bc -l <<<"$width / $scale")
  eww open bar --id "$id" --arg monitor="$id" --arg width="$scaledwidth" > /dev/null
done
