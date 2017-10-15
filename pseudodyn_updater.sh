#!/bin/sh
 
if [ ! -d "/tmp/pseudodyn_updater" ]; then
	mkdir /tmp/pseudodyn_updater
	touch /tmp/pseudodyn_updater/last_ip
	echo "pseudodyn_updater directory and database file created"
else
	if [ ! -e "/tmp/pseudodyn_updater/last_ip" ]; then
		touch /tmp/pseudodyn_updater/last_ip
		echo "pseudodyn_updater database file created"
  	else
		echo "pseudodyn_updater directory and database file already exist. Nothing to do here."
	fi
fi

currentip=$( curl ifconfig.me )
lastip=$( cat /tmp/pseudodyn_updater/last_ip )

if [ "$currentip" == "$lastip" ]; then
	echo "IP unchanged. Let's go home."
else
	echo "$currentip" > "/tmp/pseudodyn_updater/last_ip"
	echo "Saved new IP to database file"
fi