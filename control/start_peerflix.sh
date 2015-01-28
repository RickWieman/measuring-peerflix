#!/bin/bash

while read line
do
	# echo "Calling $line to update git..."
	# ssh -n -o StrictHostKeyChecking=no -l delft_peerflix $line 'cd measuring-peerflix/measurements && git pull' &
	echo "Calling $line to start experiment 1..."
	ssh -n -o StrictHostKeyChecking=no -l delft_peerflix $line 'nohup /home/delft_peerflix/measuring-peerflix/measurements/run.sh 1 "/home/delft_peerflix/measuring-peerflix/movie.torrent" < /dev/null > peerflix.log 2>&1 &' &
	sleep 2
done < $1