#!/bin/bash

# This file currently only works for Fedora Core 8.

# Let's begin with our dependencies =D
sudo yum install -y git openssl-devel gcc gcc-c++ bzip2-devel automake make

# Now, let's update to Python 2.6 (from source)
wget https://www.python.org/ftp/python/2.6.9/Python-2.6.9.tgz
tar xvzf Python-2.6.9.tgz
cd Python-2.6.9
./configure
make
sudo make install

# Finally, let's install NodeJS 0.10 (from source)
cd ..
git clone --depth 1 git://github.com/joyent/node.git
cd node
git fetch
git checkout v0.10.35
./configure
make
sudo make install

cd ..
sudo ./peerflix_npm.sh