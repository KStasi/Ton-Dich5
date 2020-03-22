#!/bin/sh
CONTRACT="kf_5GvwIvNdaWMX8STxrx1bULLf1eUvpTyatEuooSRTWyAeP" #`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `
./lite-client/lite-client -C ./lite-client/ton-global.config -l null -c 'saveaccountdata ./build/contract.boc '$CONTRACT
./sh_scripts/03_create_contract.sh
func -P -o build/reader-code.fif contracts/stdlib.fc contracts/reader-code.fc
fift -s fift_scripts/get-locations.fif $CONTRACT 1 2> /dev/null