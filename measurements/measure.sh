#!/bin/bash

# This script can be executed as soon as peerflix is serving on the web address.
# It serves as the callback script for the --on-listening parameter.

HOSTNAME=`cat /etc/hostname`
RESULT_DIR=/vagrant/results
SCRIPT_DIR=/vagrant/measurements

echo "Received callback (on-listening) at `date +%s%3N` ms" >> ${RESULT_DIR}/${HOSTNAME}_stats.txt

${SCRIPT_DIR}/starting_delay.sh > ${RESULT_DIR}/${HOSTNAME}_delay_start.txt
${SCRIPT_DIR}/skipping_delay.sh > ${RESULT_DIR}/${HOSTNAME}_delay_skip.txt