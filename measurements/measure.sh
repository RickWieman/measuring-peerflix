#!/bin/bash

# This script can be executed as soon as peerflix is serving on the web address.
# It serves as the callback script for the --on-listening parameter.

HOSTNAME=$(hostname)
RESULT_DIR=/home/delft_peerflix
SCRIPT_DIR=/home/delft_peerflix/measuring-peerflix/measurements

echo "Received callback (on-listening) at `date +%s%3N` ms" >> ${RESULT_DIR}/${HOSTNAME}_stats.txt

TIMESTAMP=$(date +%s%3N)
STARTDELAY=$(${SCRIPT_DIR}/starting_delay.sh)
SKIPDELAY=$(${SCRIPT_DIR}/skipping_delay.sh)

curl http://dev.rickw.nl/log.php -G -d "nodeid=$HOSTNAME&timestamp=$TIMESTAMP&skipDelay=$SKIPDELAY&startDelay=$STARTDELAY&experiment=$1"
