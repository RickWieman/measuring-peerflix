#!/bin/bash

# This script launches the actual experiment on a certain node.

HOSTNAME=`cat /etc/hostname`
RESULT_DIR=/vagrant/results
SCRIPT_DIR=/vagrant/measurements

# Create result directory if it doesn't exist
mkdir -p ${RESULT_DIR}

# Destroy existing sessions
pkill -9 peerflix
rm -rf /tmp/torrent-stream

echo "Started peerflix at `date +%s%3N`... " > ${RESULT_DIR}/${HOSTNAME}_stats.txt

# Start streaming
peerflix -q --on-listening "bash ${SCRIPT_DIR}/measure.sh" $1