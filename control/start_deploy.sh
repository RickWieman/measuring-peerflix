#!/bin/bash

while read line
do
	echo "Calling $line to download files..."
	ssh -n -l delft_peerflix $line 'rm -f provision.* && wget http://dev.rickw.nl/provision.sh && chmod +x provision.sh > init.log'
	echo "Calling $line to start provisioning..."
	ssh -n -l delft_peerflix $line 'nohup ./provision.sh < /dev/null > provision.log 2>&1 &' &
done < hosts.txt