#!/bin/bash
set -e

# Check if the script is running as root
if [ "$EUID" -ne 0 ]; then
  echo "Please run as root (use sudo)"
  exit 1
fi

echo "Creating udev rule for NuPhy keyboards..."

# Define the rule content
RULE='KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0666", TAG+="uaccess"'
FILE_PATH="/etc/udev/rules.d/99-hidraw-nuphy.rules"

# Write the rule to the file
echo "$RULE" > "$FILE_PATH"

echo "Rule successfully written to $FILE_PATH"

echo "Reloading udev rules..."

# Reload and trigger the new rules
udevadm control --reload-rules && udevadm trigger

echo "-----------------------------------------------------------"
echo "Done! Please UNPLUG and REPLUG your keyboard now."
echo "Then, refresh your Chromium browser and try authorizing."
