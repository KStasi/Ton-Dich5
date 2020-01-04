#!/bin/sh
CONTRACT=`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `
USER=`fift -s fift_scripts/show-addr.fif build/new-wallet-07 | cut -d ":" -f2`

./lite-client/lite-client -C ./lite-client/ton-global.config -c 'last'
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'runmethod '$CONTRACT' getplayeridx -1 0x'$USER 2>&1 |  grep result | cut -d "[" -f2 | cut -d "]" -f1 
