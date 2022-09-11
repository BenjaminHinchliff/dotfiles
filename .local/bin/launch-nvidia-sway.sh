#!/bin/bash

source "$HOME/.local/bin/setup-nvidia.sh"

"$HOME/.local/bin/launch-sway.sh" --unsupported-gpu
