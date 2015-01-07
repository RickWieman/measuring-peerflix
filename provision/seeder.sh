#!/bin/bash

# Provisioning script for the Seeder.
# NB: Run this script as root!

wget --spider http://dev.rickw.nl/log_pl.php?hostname=`hostname`\&status=seeder_installing_rtorrent

if ! type "rtorrent" > /dev/null; then
	echo ">> Installing rTorrent..."
	sudo yum install -y rtorrent
else
	echo ">> rTorrent is already installed."
fi

echo ">> Done!"

wget --spider http://dev.rickw.nl/log_pl.php?hostname=`hostname`\&status=seeder_done
