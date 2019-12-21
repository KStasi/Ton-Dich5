#!/bin/sh
fift -s fift_scripts/wallet.fif "build/new-wallet" "0f8wr3wp7mKbKpOhJfpl4RUiMbyovUWZc_neAnH2H0LZvBLQ" 1 0.5 "./build/wallet-query"
screen -S lite-client -p 0 -X stuff "sendfile ./build/wallet-query.boc
"
sleep 5
screen -S lite-client -p 0 -X stuff "last
"
screen -S lite-client -p 0 -X stuff "sendfile ./build/new-game-query.boc
"
