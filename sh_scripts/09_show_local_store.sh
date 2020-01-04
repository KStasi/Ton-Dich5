#!/bin/sh
CONTRACT=`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `
USER=`fift -s fift_scripts/show-addr.fif build/new-wallet-07 | cut -d ":" -f2`

./lite-client/lite-client -C ./lite-client/ton-global.config -c 'last'
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'saveaccountdata ./build/contract.boc '$CONTRACT
fift -s fift_scripts/get-local-store.fif