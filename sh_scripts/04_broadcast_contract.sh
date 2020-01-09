#!/bin/sh
WALLET_NAME="build/new-wallet-00"
CONTRACT=`fift -s fift_scripts/show-init-addr.fif build/new-game `
USER=`fift -s fift_scripts/show-bouceable-addr.fif $WALLET_NAME`
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'last'
SEQNO=`./lite-client/lite-client -C ./lite-client/ton-global.config -c 'runmethod '$USER' seqno' 2>&1 |  grep result | cut -d "[" -f2 | cut -d "]" -f1`

fift -s fift_scripts/wallet.fif $WALLET_NAME $CONTRACT $SEQNO 0.5 "./build/wallet-query"
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'last'
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'sendfile ./build/wallet-query.boc'
sleep 5
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'last'
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'sendfile ./build/new-game-query.boc'