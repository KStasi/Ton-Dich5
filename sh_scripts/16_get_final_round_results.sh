#!/bin/sh
CONTRACT="kf-tRnWNAZDD8D3LNqFuSty8BIantwY2KqI6FBmo3Ac-yIfv"
GAME_IDX=2
./lite-client/lite-client -v 0 -C ./lite-client/ton-global.config -l /dev/null -c 'last'
./lite-client/lite-client -C ./lite-client/ton-global.config -l /dev/null -c 'saveaccountdata ./build/contract.boc '$CONTRACT
fift -s fift_scripts/get-final-round-results.fif $CONTRACT $GAME_IDX

