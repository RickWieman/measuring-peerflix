#!/bin/bash

# This script launches the actual experiment on a certain node.

HOSTNAME=$(hostname)
RESULT_DIR=/home/delft_peerflix
SCRIPT_DIR=/home/delft_peerflix/measuring-peerflix/measurements

# Destroy existing sessions
pkill -9 peerflix
rm -rf /tmp/torrent-stream

echo "Started peerflix at `date +%s%3N`... " > ${RESULT_DIR}/${HOSTNAME}_stats.txt

# Start streaming
peerflix -q --on-listening "bash ${SCRIPT_DIR}/measure.sh" $1