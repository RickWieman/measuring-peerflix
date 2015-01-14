#!/bin/bash

# This file currently only works for Fedora 14.

wget --spider http://dev.rickw.nl/log_pl.php?hostname=`hostname`\&status=peerflix14_installing_node

wget http://nodejs.org/dist/v0.10.35/node-v0.10.35-linux-x86.tar.gz
sudo -S tar --strip-components 1 -xzvf node-v0.10.35-linux-x86.tar.gz -C /usr

wget --spider http://dev.rickw.nl/log_pl.php?hostname=`hostname`\&status=peerflix14_installing_peerflix

sudo -S npm install -g peerflix

wget --spider http://dev.rickw.nl/log_pl.php?hostname=`hostname`\&status=peerflix14_ready