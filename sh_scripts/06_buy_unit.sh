#!/bin/sh
CONTRACT=`fift -s fift_scripts/show-bouceable-addr.fif build/new-game `

for i in 0 1 2 3 4 5 6 7
do
    wallet_name="build/new-wallet-0"$i
    user=`fift -s fift_scripts/show-bouceable-addr.fif $wallet_name`
    units=("10001 1 8" "20002 2 8" "30003 3 8" "40004 4 8" "50005 5 8")
    for unit in "${units[@]}"
    do
        unit_arr=($unit)
        type=${unit_arr[0]}
        level=${unit_arr[1]}
        counter=${unit_arr[2]}
        fift -s fift_scripts/buy-unit.fif $type $level $counter
        ./lite-client/lite-client -C ./lite-client/ton-global.config -l null -c 'last'
        seqno=`./lite-client/lite-client -C ./lite-client/ton-global.config -c 'runmethod '$user' seqno' 2>&1 |  grep result | cut -d "[" -f2 | cut -d "]" -f1`
        fift -s fift_scripts/wallet.fif "build/new-wallet-0"$i $CONTRACT $seqno 0.5 "./build/wallet-query" -B "./build/buy-unit.boc"

        ./lite-client/lite-client -C ./lite-client/ton-global.config -l null -c 'sendfile ./build/wallet-query.boc'
        sleep 3
    done
done

