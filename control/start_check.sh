#!/bin/bash

while read line
do
	echo "Calling $line to download files..."
	ssh -n -o StrictHostKeyChecking=no -l delft_peerflix $line 'rm -f check.* && wget http://dev.rickw.nl/check.sh && chmod +x check.sh && ./check.sh' &
done < $1