#!/bin/bash

# Find the touchpad device name
touchpad_device=$(xinput --list | grep -i "7E92 Touchpad" | awk -F"=" "{print \$2}" | awk "{print \$1}")

# Enable tap-to-click
xinput -set-prop "$touchpad_device" 'libinput Tapping Enabled' 1

# Enable natural scrolling
xinput -set-prop "$touchpad_device" 'libinput Natural Scrolling Enabled' 1
