#!/bin/bash

# Get Current Scailing factor
SCALE=$(gsettings get org.gnome.desktop.interface text-scaling-factor)

# Set what to toggle to
if [ $SCALE == '1.0' ]; then
    SCALE_SWITCH=1.25
elif [ $SCALE == '1.25' ]; then
    SCALE_SWITCH=1.5
else [ $SCALE == '1.5' ]
    SCALE_SWITCH=1.0
fi

# (Optional) Message intentions to CLI and GNOME Notifications
echo -e "Previous Font Scale: $SCALE, Switched to $SCALE_SWITCH"
notify-send "Previous Font Scale: $SCALE, Switched to $SCALE_SWITCH"

# Run switch command
gsettings set org.gnome.desktop.interface text-scaling-factor $SCALE_SWITCH