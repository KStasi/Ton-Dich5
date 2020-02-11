#!/bin/sh
CONTRACT=`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `
GAME_IDX=1
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'last'
./lite-client/lite-client -C ./lite-client/ton-global.config -c 'runmethod '$CONTRACT' getfinalroundresults '$GAME_IDX 2>&1  

