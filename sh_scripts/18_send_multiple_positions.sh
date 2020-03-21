#!/bin/sh
CONTRACT="kf-tRnWNAZDD8D3LNqFuSty8BIantwY2KqI6FBmo3Ac-yIfv" #`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `

for i in 3 4
do
    wallet_name="build/new-wallet-0"$i
    user=`fift -s fift_scripts/show-bouceable-addr.fif $wallet_name`
    user_x=`fift -s fift_scripts/show-addr.fif $wallet_name | cut -d ":" -f2`
    location_source="./fift_scripts/locations/locations-source-0$i.fif"
    ./lite-client/lite-client -C ./lite-client/ton-global.config -l null -c 'last'
    # player_idx=`./lite-client/lite-client -v 0 -C ./lite-client/ton-global.config -c 'runmethod '$CONTRACT' getplayeridx -1 0x'$user_x |  grep 'remote result' | cut -d "[" -f2 | cut -d "]" -f1`
    # game_idx=`./lite-client/lite-client -v 0 -C ./lite-client/ton-global.config -c 'runmethod '$CONTRACT' getuser -1 0x'$user_x |  grep 'remote result' | cut -d "[" -f2 | cut -d "]" -f1 | cut -d " " -f3`

    fift -s fift_scripts/arrange-units.fif location_source
    seqno=`./lite-client/lite-client  -v 0 -C ./lite-client/ton-global.config -c 'runmethod '$user' seqno' |  grep 'remote result' | cut -d "[" -f2 | cut -d "]" -f1`
    fift -s fift_scripts/wallet.fif "build/new-wallet-0"$i $CONTRACT $seqno 0.5 "./build/wallet-query" -B "./build/arrange-units.boc"
    ./lite-client/lite-client -C ./lite-client/ton-global.config -l null -c 'sendfile ./build/wallet-query.boc'
    sleep 3
done

