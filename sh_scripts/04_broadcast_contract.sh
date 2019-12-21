#!/bin/sh
fift -s fift_scripts/wallet.fif "build/new-wallet" "0f8Gl0Pc2yYkxNzWOTU8f6DOsdY32_2SEma705D7cVK3DptE" 4 0.5 "./build/wallet-query"
screen -S lite-client -p 0 -X stuff "sendfile ./build/wallet-query.boc
"
sleep 5
screen -S lite-client -p 0 -X stuff "last
"
screen -S lite-client -p 0 -X stuff "sendfile ./build/new-game-query.boc
"
