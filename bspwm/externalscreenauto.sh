#!/bin/bash
# Detect the HDMI connection
hdmi_status=$(xrandr -q | grep -c 'HDMI-1-0 connected')
# Check the HDMI connection status
if [ $hdmi_status -eq 1 ]; then
    # If HDMI is connected
    #notify-send "HDMI is connected"
    # Enable HDMI output and set it as the primary display
    xrandr --output HDMI-1-0 --primary --mode 1920x1080 
    xrandr --output eDP-1 --off
else
    # If HDMI is not connected
    #notify-send "HDMI is not connected"
    # Enable the laptop's display and set it as the primary display
    # Assuming that the laptop's display is connected to eDP1
    xrandr --output eDP-1 --primary --mode 1920x1080 
fi
