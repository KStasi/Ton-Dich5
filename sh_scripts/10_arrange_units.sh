#!/bin/sh
CONTRACT=`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `
fift -s fift_scripts/arrange-units.fif
fift -s fift_scripts/wallet.fif "build/new-wallet-03" $CONTRACT 8 0.5 "./build/wallet-query" -B "./build/arrange-units.boc"
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'sendfile ./build/wallet-query.boc'
