#!/bin/bash

# This script should be run as root in the end.
# Because of this export, it has to be run separately.
export PATH=$PATH:/usr/local/bin:/usr/local

# First update npm
npm install -g npm

# Now install peerflix.
npm install -g peerflix