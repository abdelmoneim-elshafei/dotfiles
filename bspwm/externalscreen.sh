#!/bin/bash

# Find the connected screens and input devices
laptop_screen=$(xrandr --query | grep -w "connected" | grep "eDP" | awk "{print \$1}")
hdmi_screen=$(xrandr --query | grep -w "connected" | grep "HDMI" | awk "{print \$1}")
#input_device_id=$(xinput --list | grep -i "touchpad\|touchscreen" | awk '{print \$6}' | awk -F= '{print \$2}')

# Check if the HDMI screen is connected
if [ ! -z "$hdmi_screen" ]; then
  # Configure the HDMI screen as the main screen and disable the laptop screen
  
  xrandr --output "$hdmi_screen" --primary --mode 1920x1080
  xrandr --output "$laptop_screen" --off

  # Map the input devices to the HDMI screen
  # xinput map-to-output "$input_device_id" "$hdmi_screen"
else
  echo "HDMI screen not connected"
fi
