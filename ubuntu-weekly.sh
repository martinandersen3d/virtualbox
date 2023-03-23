#!/bin/bash

# This script will run from CRON

# Setup Environment:

# Set the DISPLAY variable to the current user's display
export DISPLAY=:0

# Set the DBUS_SESSION_BUS_ADDRESS variable to the current user's DBus session address
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

# Set the XAUTHORITY variable to the current user's Xauthority file
export XAUTHORITY=/home/h/.Xauthority                # <<<<<<<<<<<<< CHANGE USERNAME  

#---------------------------------------------
# Script you want to run:
#---------------------------------------------


/home/h/Scripts/virtualbox/ubuntu-backup.sh "weekly"