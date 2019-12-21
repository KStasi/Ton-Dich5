#!/bin/sh
fift -s fift_scripts/update-prices.fif
fift -s fift_scripts/wallet.fif "build/new-wallet" "0f8wr3wp7mKbKpOhJfpl4RUiMbyovUWZc_neAnH2H0LZvBLQ" 3 1 "./build/wallet-query" -B "./build/update-prices.boc"
screen -S lite-client -p 0 -X stuff "sendfile ./build/wallet-query.boc
"
