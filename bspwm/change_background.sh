#!/bin/bash

# Directory containing the wallpapers
WALLPAPER_DIR="/home/abdelmoneim/Wallpaper"

# Time interval in seconds (300 seconds = 5 minutes)
INTERVAL="300"

while true; do
  # Select a random jpg file from the wallpaper directory
  WALLPAPER=$(ls $WALLPAPER_DIR/*.jpg | shuf -n 1)

  # Set the wallpaper
  feh --bg-fill "$WALLPAPER"

  # Wait for the specified interval
  sleep $INTERVAL
done