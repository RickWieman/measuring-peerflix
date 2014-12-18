#!/bin/bash

# Provisioning script for the Seeder.
# NB: Run this script as root!

if ! type "deluged" > /dev/null; then
	echo ">> Installing Deluge..."
	yum install -y deluged deluge-console
else
	echo ">> Deluge is already installed."
fi

echo ">> Allowing incoming connections..."
iptables -A INPUT -p tcp --dport 56881:56889 -j ACCEPT
iptables -A INPUT -p udp --dport 56881:56889 -j ACCEPT

echo ">> Done!"