#!/usr/bin/bash

export MOZ_ENABLE_WAYLAND=1
export MOZ_DRM_DEVICE=$(drm_info -j | jq -r 'first(to_entries[] | select(.value.driver.desc | contains("Intel")) | .key)')
exec /usr/bin/firefox $@
