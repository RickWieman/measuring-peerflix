#!/bin/bash

while read line
do
	# echo "Calling $line to update git..."
	# ssh -n -o StrictHostKeyChecking=no -l delft_peerflix $line 'cd measuring-peerflix/measurements && git pull'
	echo "Calling $line to stop peerflix..."
	ssh -n -o StrictHostKeyChecking=no -l delft_peerflix $line 'nohup /home/delft_peerflix/measuring-peerflix/measurements/stop.sh < /dev/null > peerflix.log 2>&1 &' &
done < $1