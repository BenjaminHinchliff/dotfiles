#!/bin/sh

cd ~

export _JAVA_AWT_WM_NONREPARENTING=1
# export XCURSOR_SIZE=24
export QT_QPA_PLATFORMTHEME=qt5ct
export GTK_THEME="Catppuccin-Mocha-Standard-Rosewater-Dark"
# i18n
# export GTK_IM_MODULE=ibus
# export QT_IM_MODULE=ibus
# export XMODIFIERS=@im=ibus
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
GLFW_IM_MODULE=ibus

exec $@
