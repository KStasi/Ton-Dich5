#!/bin/sh
CONTRACT="kf-tRnWNAZDD8D3LNqFuSty8BIantwY2KqI6FBmo3Ac-yIfv" #`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `
./lite-client/lite-client -C ./lite-client/ton-global.config -l null -c 'saveaccountdata ./build/contract.boc '$CONTRACT
./sh_scripts/03_create_contract.sh
fift -s fift_scripts/get-locations.fif $CONTRACT 1