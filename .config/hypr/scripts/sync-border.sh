#!/usr/bin/env bash
accent=$(grep "define-color accent_color" ~/.config/gtk-3.0/noctalia.css | head -1 | awk '{print $3}' | tr -d ';')
hex=${accent:1:6}
sed -i "s/^CACHYLGREEN = .*/CACHYLGREEN = \"rgba(${hex}ff)\"/" ~/.config/hypr/config/colors.lua
sed -i "s/^CACHYDGREEN = .*/CACHYDGREEN = \"rgba(${hex}ff)\"/" ~/.config/hypr/config/colors.lua
hyprctl reload
