#!/bin/bash

NODEID=$(cat .ssh/id_rsa.pub)
NODEID=${NODEID// /%20}
TIMESTAMP=$(date +%s%3N)
STARTDELAY="4232"
SKIPDELAY="42"

curl 192.168.1.15/log.php -G -d "nodeid=$NODEID&timestamp=$TIMESTAMP&skipDelay=$SKIPDELAY&startDelay=$STARTDELAY"

