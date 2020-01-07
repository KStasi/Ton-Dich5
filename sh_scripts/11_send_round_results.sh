#!/bin/sh
WALLET_NAME="build/new-wallet"
GAME_IDX=1
CONTRACT=`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `
USER=`fift -s fift_scripts/show-bouceable-addr.fif $WALLET_NAME`
USER_HEX=`fift -s fift_scripts/show-addr.fif $WALLET_NAME | cut -d ":" -f2`
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'last'
SEQNO=`./lite-client/lite-client -C ./lite-client/ton-global.config -c 'runmethod '$USER' seqno' 2>&1 |  grep result | cut -d "[" -f2 | cut -d "]" -f1`
PLAYER_IDX=`./lite-client/lite-client -C ./lite-client/ton-global.config -c 'runmethod '$CONTRACT' getplayeridx -1 0x'$USER_HEX 2>&1 |  grep result | cut -d "[" -f2 | cut -d "]" -f1 `


fift -s fift_scripts/send-round-results.fif $GAME_IDX $PLAYER_IDX
fift -s fift_scripts/wallet.fif $WALLET_NAME $CONTRACT $SEQNO 3 "./build/wallet-query" -B "./build/send-round-results.boc"
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'sendfile ./build/wallet-query.boc'
