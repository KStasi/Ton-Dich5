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

## How to use