#!/bin/bash

# exports the required environment variables for wayland nvidia
export LIBVA_DRIVER_NAME=nvidia
export XDG_SESSION_TYPE=wayland
export GBM_BACKEND=nvidia-drm
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export WLR_NO_HARDWARE_CURSORS=1
export WLR_RENDERER=vulkan
export XWAYLAND_NO_GLAMOR=1

source /home/benja/.local/bin/wrap-wayland.sh
