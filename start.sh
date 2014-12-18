#!/bin/bash

# This script launches the actual experiment.

# This script will contact the seeder nodes to let them start seeding
# and contact the peerflix nodes to start playing

DOWNLOAD_PATH=/vagrant
TORRENT=${DOWNLOAD_PATH}/movie.torrent

## VAGRANT

vagrant up --provision --parallel

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

for i in {1..9}; do
	vagrant ssh peerflix-${i} -c "bash /vagrant/measurements/run.sh ${TORRENT} &" &
done