#!/bin/bash

# Terminate any existing Polybar instances
killall -q polybar
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch a Polybar instance for each connected monitor
xrandr -q | awk "/ connected / {print \$1}" | while read -r monitor; do
  MONITOR=$monitor polybar -r mybar &
done