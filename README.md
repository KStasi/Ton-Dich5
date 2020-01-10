# Dota2 auto chess

## Introduction

This project is dedicated to the popular game Dota2 Autochess. The main idea is to use TON as a payment system and trust source.

## User story
The user comes to the platform and buys units for the game using his wallet. Along with it he becomes registred for the next ACTIVE_PERIOD (it is updated with every purchase). As soon as it is expired his account is automatically removed from the contract. Actually, payment for storing his game account is included in units price.

User should have enough units to line up to the game queue and play. He needs exactly 8 units of each level to make a transaction that sets him to the game queue. For this action, the number, levels, and types of units for the next match should be specified. He pays some fee to be in the queue. As soon as the period is expired but contenders are not found he is removed from the queue and new games with other units are accepted.

If the 8 players come to queue they are organized to the match team and are removed from the queue. The last contender pays for it what is quite unfair. The match starts, all units are collected and mixed and send to the local round store. 

Players have some time before the round starts to buy units from local store using local game balance (golds). Before timeout they should locate their units on the board and send data to the contract along with list of the bords opponents for all round counted based on the same random. Contract compares data from all participants and chooses the most common option, incrementing bans points for cheaters.

Then round results are calculated off-chain and submitted to the contract as list off win/loses and player states updates (hp, golds, exp and so on) for all players from all participants. The most common options are chosen bans points are incremented for cheaters. 

If the player loses all his hp he is removed from the game and receives the reward as all units he has in his last game. These units are removed from the game pool. If the player has 7 or 8 plays in top, two units are charged as penalty and fee.

When single player is left he receives his reward and the game is deleted. 

## Owner story

Owner may set unit prices using a special external transaction. He may set any price up to MAX_UINT32 for any level of the unit types.

Owner may withdraw profit from the contract.

Owner has the right to ban users.

## Project Stages

NOTE: partially connected to fronted 

## How to use

The project has the following structure:
Dich5
	build/
    contracts/
	fift_scripts/
	lite-client/
	sh_scripts/
	tests/


In the *sh_scripts* game flow sre present.

1. *01_create_wallet.sh* is intended to create wallet for user if he doesn't have one. It isn't obligatory and he may just place it's keys and address to *build/*.
2. If wallet wasn't brought by user, new one should be funded and then it's code is broadcasted by *02_broadcast_wallet.sh*
3. *03_create_contract.sh* compile contract and create boc file for init.
4. New contract is funded by new user's wallet and it's code is set by *04_broadcast_contract.sh*
5. New price list is sent by *05_update_prices.sh*
6. *06_buy_unit.sh* used to by few units.
07. *07_line_up.sh* is used to line up to queue with units configured in *units-source.fif*.

# Testing

Run:
```
./sh_scripts/test.sh 
```

# Scripts explained

There are two script types:
 - fift
 - shell.

 First type intends to prepare one single boc file for one action or get some blockchain information for one instance (game or player). 

 Second type is used for testing and mostly executes actions for few players per usage.

`wallet.fif` WALLET_NAME CONTRACT SEQNO AMOUNT QUERY_FILE_NAME
Main script for all wallet manipulations. It is used to wrap most of boc file and to send it as internal message to `Game` contract along with some Grams.

`arrange-units.fif` LOCATION_SOURCE
The script to prepare internal message with units positions in the round. Units locations are specified in LOCATION_SOURCE Note: it should be send from wallet.

`buy-unit.fif` TYPE LEVEL COUNTER
The script to prepare internal message with units that should be bought in the store. Unit TYPE, LEVEL and COUNTER should 
be provided. Note: it should be send from wallet.

`get-local-store.fif` GAME_IDX
The script to get current round local store. Returns 5 arrays with PLAYER_IDX describes units (index in array is UNIT_IDX in game) they are allowed to buy in the round. Note: NOT send it to network; script uses CONTRACT_STATE from file.

`line-up-queue.fif` 
The script to prepare internal message to line up user to players queue for next game. Note: it should be send from wallet.

`locations/`
Folder that contains LOCATION_SOURCEs. 

`locations-source.fif`
LOCATION_SOURCE example.

`new-game.fif`
The script to create new game contract.

`new-wallet.fif`
The script to create new wallet contract.

`results-source.fif`
RESULT_SOURCE example.

`send-round-results.fif`

`show-addr.fif` WALLET_NAME
The script to display address of WALLET_NAME. Note: NOT send it to network.

`show-bouceable-addr.fif`
The script to display address of WALLET_NAME. Note: NOT send it to network.

`show-init-addr.fif`
The script to display address of WALLET_NAME. Note: NOT send it to network.

`units-source.fif`
UNITS_SOURCE example.

`update-prices.fif` SEQNO
The script for external message to contract to update units prices. UNITS_SOURCE is set to `units-source.fif` by default.

By default all `.boc` outputs are stored in `build/`
