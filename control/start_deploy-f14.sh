#!/bin/bash

while read line
do
	echo "Calling $line to download files..."
	ssh -n -o StrictHostKeyChecking=no -l delft_peerflix $line 'rm -f provision-f14.* && wget http://dev.rickw.nl/provision-f14.sh && chmod +x provision-f14.sh > init.log'
	echo "Calling $line to start provisioning..."
	ssh -n -o StrictHostKeyChecking=no -l delft_peerflix $line 'nohup ./provision-f14.sh < /dev/null > provision.log 2>&1 &' &
done < hosts.txt