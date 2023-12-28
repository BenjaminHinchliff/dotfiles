#!/usr/bin/bash

export MOZ_ENABLE_WAYLAND=1
export MOZ_DRM_DEVICE="/dev/dri/card0"
exec /usr/bin/firefox "$@"
