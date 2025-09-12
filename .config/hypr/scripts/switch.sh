#!/bin/bash

if grep open /proc/acpi/button/lid/LID0/state; then
  hyprctl keyword monitor "eDP-1, 1920x1200, 2560x1440, 1"
else
  if [[ $(hyprctl monitors | grep "Monitor" | wc -l) != 1 ]]; then
    hyprctl keyword monitor "eDP-1, disable"
  fi
fi
