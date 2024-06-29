#!/bin/bash

BANNED_IP=$1
FILE_PATH="/home/citact/banipsync/banip.txt"
LOG_FILE="/home/citact/banipsync/ban_ip.log"
GIT_REPO="/home/citact/banipsync"

# Log the banned IP
echo "$(date +'%Y-%m-%d %H:%M:%S') - Banning IP: $BANNED_IP" >> $LOG_FILE

# Append the banned IP to the file
echo $BANNED_IP >> $FILE_PATH

# Change to the git repo directory
cd $GIT_REPO

# Ensure the directory is marked as safe
sudo -u citact git config --global --add safe.directory $GIT_REPO

# Add changes to git
sudo -u citact git add $FILE_PATH

# Commit the changes with a message
sudo -u citact git commit -m "Banned IP: $BANNED_IP"

# Push the changes to GitHub
sudo -u citact git push origin master

# Log success message
echo "$(date +'%Y-%m-%d %H:%M:%S') - Successfully banned IP: $BANNED_IP" >> $LOG_FILE

