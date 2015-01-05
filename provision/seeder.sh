#!/bin/bash

# Provisioning script for the Seeder.
# NB: Run this script as root!

if ! type "rtorrent" > /dev/null; then
	echo ">> Installing rTorrent..."
	yum install -y rtorrent
else
	echo ">> rTorrent is already installed."
fi

echo ">> Done!"