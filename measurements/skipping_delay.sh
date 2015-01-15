#!/bin/bash

start_time=`date +%s%3N`
random1=$[ (( $RANDOM % 200 ) + 10) * 1048576 ]
random2=`expr ${random1} + 900000`
curl --header "Range: bytes=${random1}-${random2}" http://127.0.0.1:54529 > /dev/null
end_time=`date +%s%3N`
expr ${end_time} - ${start_time}