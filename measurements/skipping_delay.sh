#!/bin/bash

start_time=`date +%s%3N`
curl --header "Range: bytes=107848916-107900000" http://127.0.0.1:8888 > /dev/null
end_time=`date +%s%3N`
expr ${end_time} - ${start_time}