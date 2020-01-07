#!/bin/sh
# CONTRACT=`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `
# fift -s fift_scripts/line-up-queue.fif
# fift -s fift_scripts/wallet.fif "build/new-wallet" $CONTRACT 48 2.5 "./build/wallet-query" -B "./build/line-up.boc"
# ./lite-client/lite-client -C ./lite-client/ton-global.config -c 'sendfile ./build/wallet-query.boc'

CONTRACT=`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `
fift -s fift_scripts/line-up-queue.fif

fift -s fift_scripts/wallet.fif "build/new-wallet-07" $CONTRACT 8 4.5 "./build/wallet-query" -B "./build/line-up.boc"
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'sendfile ./build/wallet-query.boc'