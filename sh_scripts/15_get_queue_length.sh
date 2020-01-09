#!/bin/sh
CONTRACT=`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `

./lite-client/lite-client -C ./lite-client/ton-global.config -c 'last'
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'runmethod '$CONTRACT' getqueuelen' 2>&1 |  grep result | cut -d "[" -f2 | cut -d "]" -f1 

