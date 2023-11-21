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
----- Transaction Effects ----
Status : Success
Created Objects:
  - ID: 0x615d946a5605cf1748ad12ecdac35af028a40dfcd16f2aba6be62551eed016b1 , Owner: Account Address ( 0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7 )
  - ID: 0xcb469efcc88664893e4350b5f3719c01e302a9c1c199a9f96e11eb18381b8f1e , Owner: Immutable
Mutated Objects:
  - ID: 0xaa25f5eea6da7d99356dee7eeff4a23b8f49a05fadd409b966774fc21a6a834c , Owner: Account Address ( 0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7 )
```

### 4.Call function to play game

You'll call the play function to start game.  
In a separate terminal execute:  
`$ sui client call --package 0xcb469efcc88664893e4350b5f3719c01e302a9c1c199a9f96e11eb18381b8f1e --module finger_guessing --function play --gas-budget 100000000 --args Rock`

```shell
--package = the package_id of contract that was deployed on SUI
--module = finger_guessing
--function = play
--args = the arguments of function .You'll pass three correct arguments when to call play function ,such as "Rock","Scissors","Paper", other arguments will be returned the failed info 
```

### 5.Result of game

You'll find the call log of game after you called the play function.

You can discover the result of game on the Events,which is a part of entire log.

`The Events log contain completed information.You can get the specific result of game via observing 'parsedJson' field.The game has three outcomes: 'dogfall', 'you win', and 'you lose'.  

Below is the full Events log

----- Events ----

Array [
Object {
"id": Object {
"txDigest": String("A9932hWJez4eSDLggMgdKpMbF4738yT5CkbaomJRLYVh"),
"eventSeq": String("0"),
},
"packageId": String("0xcb469efcc88664893e4350b5f3719c01e302a9c1c199a9f96e11eb18381b8f1e"),
"transactionModule": String("finger_guessing"),
"sender": String("0x5cca2192331ca9db87a6adfc756f809150aad3f8a2bf7eb3b68dd46ea03989f7"),
"type": String("0xcb469efcc88664893e4350b5f3719c01e302a9c1c199a9f96e11eb18381b8f1e::finger_guessing::Result"),
"parsedJson": Object {
"msg": String("dogfall"),
},
"bcs": String("2EiTdHcCTDd"),
},
]

`
