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


# Lastly, I wanted the ability to execute the script by hitting a key binding. First, I made a symbolic link to the script location from /usr/bin/toggle-font-scale:
# sudo ln -s /home/local/dotfiles/scripts/toggle-gnome-font-scale /usr/bin/toggle-font-scale
# Next, I added a custom Gnome keyboard shortcut using gnome settings (for me, CTRL+SHIFT+M) to run the script, which toggles the scaling factor.
