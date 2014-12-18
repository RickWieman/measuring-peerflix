#!/bin/bash

# Provisioning script for the Peerflix nodes.
# NB: Run this script as root!

# As we use a recent version of Fedora, we expect nodejs will be in the repo
# If not, execute `curl -sL https://rpm.nodesource.com/setup | bash -`
# and install only nodejs with yum (remove npm below)

echo ">> Installing Nodejs and NPM..."
yum install -y nodejs npm

echo ">> Installing Peerflix..."
npm install -g peerflix

echo ">> Done!"