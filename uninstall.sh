#!/bin/bash
# If something fails - exit
set -e
# Check if root
if [[ whoami != 'root' ]]; then
	echo "Must be root to run this installer."
	exit 1;
fi

# Removes bashShot from crontab
MYCRON=/tmp/mycron.txt
(crontab -l | grep -iv bashshot | grep -iv "cleaner scripts") > $MYCRON
crontab $MYCRON

# Removes scripts
rm /usr/bin/bashshot.sh
rm /usr/bin/bashshot_cleaner.sh

# Removes configuration
rm -r /etc/bashshot

# Removes file for log rotation
rm /etc/logrotate.d/bashshot

