#!/bin/sh
CONTRACT=`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'last'
SEQNO=`./lite-client/lite-client -C ./lite-client/ton-global.config -c 'runmethod '$CONTRACT' getstorage' 2>&1 |  grep result | cut -d "[" -f2 | cut -d "]" -f1 | cut -d " " -f6`

fift -s fift_scripts/update-prices.fif $SEQNO
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'last'
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'sendfile ./build/update-prices-query.boc'