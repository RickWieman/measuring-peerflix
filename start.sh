#!/bin/bash

# This script launches the actual experiment.

# This script will contact the seeder nodes to let them start seeding
# and contact the peerflix nodes to start playing

DOWNLOAD_PATH=/vagrant
TORRENT=${DOWNLOAD_PATH}/movie.torrent

## VAGRANT

vagrant up --provision

## SEEDERS

echo ">> Starting Deluge daemon..."
vagrant ssh seeder-1 -c "deluged"

# We have to wait for deluge to set everything up...
sleep 5

echo ">> Disabling DHT..."
vagrant ssh seeder-1 -c "deluge-console \"config -s dht False\""

echo ">> Giving the torrent to deluge..."
vagrant ssh seeder-1 -c "deluge-console \"add -p ${DOWNLOAD_PATH} ${TORRENT}\""


## PEERFLIX

echo ">> Running peerflix and measurements (note: in parallel)..."
for i in { 1..9 }; do
	vagrant ssh peerflix-${i} -c "peerflix ${TORRENT} > /dev/null &" &
done

for i in { 1..9 }; do
	vagrant ssh peerflix-${i} -c "/vagrant/measurements/starting_delay.sh" > results/delay_${i}_start.txt &
	vagrant ssh peerflix-${i} -c "/vagrant/measurements/skipping_delay.sh" > results/delay_${i}_skip.txt &
done

echo ">> Script done! Please check the results directory (might be filling up slowly)."