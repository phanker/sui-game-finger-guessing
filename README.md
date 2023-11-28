# sui-game-finger-guessing

## Technology Stack & Tools

- [Sui](https://sui.io/) (Block Chain)
- Move (Writing Smart Contracts)

## Setting Up

### 1. Clone/Download the Repository

### 2. Build Project:

`$ sui move client build`

### 3.Deploy contract:

In a separate terminal,go to the project root directory and execute:
`$ sui client publish --gas-budget 100000000`

Get the 'package_id' of contract from the log of deployment:
You'll find the "Transaction Effects" log below,the symbol 'ID' and 'Owner: Immutable' represent 'package_id'.  
On this log,0xcb469efcc88664893e4350b5f3719c01e302a9c1c199a9f96e11eb18381b8f1e is exact package_id.

```
 Created Objects:                                                                                  │
│  ┌──                                                                                              │
│  │ ID: 0x15c8530550585ba2568f18fd2676ac626e42e1ef9370aac362be5a1303d2bd3d                         │
│  │ Owner: Immutable                                                                               │
│  │ Version: 1                                                                                     │
│  │ Digest: 3ni1MZ1T5qZreTHamw8mgWYysvrLiKwsKceFXvdCicP4                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0x76b2e39b11328beced9c3d99f54a90d34ccd371a48b7c3da9c01140eef52ad4e                         │
│  │ Owner: Account Address ( 0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7 )  │
│  │ Version: 17229476                                                                              │
│  │ Digest: 5dmPGQXiKWFrVvod7yYTVG2FCseB3U9Vgntd2mR258xg                                           │
│  └──                                                                                              │
│  ┌──                                                                                              │
│  │ ID: 0xbff91a5fd90bb5cb38d770494ba772cbcd99ce5d39b7246b2bb26002c09f01c7                         │
│  │ Owner: Shared                                                                                  │
│  │ Version: 17229476                                                                              │
│  │ Digest: GiaVnujLZnR2nDd5At62oxPDnrkAL5wRu9DhYneBULD3
```

### 4.Game Introduction

1. This is a rock-paper-scissors game,Randomly generate a gesture on sui blockchain, and compare the gesture you guess to gain reward.
2. You'll pay 0.1 sui to participate in the game.
3. If you win a game,you'll get a double rewards.
4. If you lost a game,you just pay for the fee for a game.
5. If it's a tie,you just pay the gas fee for a game.

### 5.Call function to play game

You'll call the play function to start game.  
In a separate terminal execute:  
details of args,  
sui_holder: the object id of sui holder,it is a shared object that you can pass it to participate in the game.  
input_gesture: the gesture you guess.up to now,it just supports 'Rock' , 'Scissors' and 'Paper'.  
fee: &mut Coin<SUI>, it reprents you need pass your object of sui coins you posses.  
clock: &Clock, it's a standarad object.it just passes '0x6' is okay.

```shell
sui client call \
--package  0x15c8530550585ba2568f18fd2676ac626e42e1ef9370aac362be5a1303d2bd3d \
 --module finger_guessing \
 --function play \
 --gas-budget 10000000 \
 --args 0xbff91a5fd90bb5cb38d770494ba772cbcd99ce5d39b7246b2bb26002c09f01c7 Scissors 0xaf51d4fa724f294eb244a91ab4e244d4c7dad998d33564ced2c47e918578913b 0x6
```

### 6.Result of game

You'll find the call log of game after you called the play function.

You can discover the result of game on the Events,which is a part of entire log.

`The Events log contain completed information.You can get the specific result of game via observing 'parsedJson' field.The game has three outcomes: 'dogfall', 'you win', and 'you lose'.

Below is the full Events log

----- Events ----
Array [
Object {
"id": Object {
"txDigest": String("AYxJyewZWgUiGp1zr9eArpywiNWrgbPvjeBQyARUWpjr"),
"eventSeq": String("0"),
},
"packageId": String("0x15c8530550585ba2568f18fd2676ac626e42e1ef9370aac362be5a1303d2bd3d"),
"transactionModule": String("finger_guessing"),
"sender": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
"type": String("0x15c8530550585ba2568f18fd2676ac626e42e1ef9370aac362be5a1303d2bd3d::finger_guessing::Result"),
"parsedJson": Object {
"msg": String("computer's gesture is :Rock, your input_gesture is :Scissors"),
},
"bcs": String("pEagWmHqvCi2yZGDBi79UX8trNygDR3WvF3EDXNAFkvEvw2bAYEdPLHf7sgyHYtTkXtz1k6P4FQfo1He39L"),
},
Object {
"id": Object {
"txDigest": String("AYxJyewZWgUiGp1zr9eArpywiNWrgbPvjeBQyARUWpjr"),
"eventSeq": String("1"),
},
"packageId": String("0x15c8530550585ba2568f18fd2676ac626e42e1ef9370aac362be5a1303d2bd3d"),
"transactionModule": String("finger_guessing"),
"sender": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
"type": String("0x15c8530550585ba2568f18fd2676ac626e42e1ef9370aac362be5a1303d2bd3d::finger_guessing::Result"),
"parsedJson": Object {
"msg": String("you lost!"),
},
"bcs": String("XscVvYy2cRnSL"),
},
]

`
