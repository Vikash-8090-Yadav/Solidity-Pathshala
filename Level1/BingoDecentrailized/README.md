# Decentralized Bingo Game

## What is Bingo

Bingo is a fun game of chance that anyone can play. The game is played on a scorecard that's made up of 25 squares — if you get 5 squares in a row, you win!
A random number is called out at each round which gets stricken out at the players card. Ussualy a host is responsible for carrying out this task.

## My Take

I wanted there to be no 'Host'. Following method was deviced,
- The consists of rounds
- each round a player is assigned the master role,
- all the players vote for which number should be stricked out,
- In case of a draw the masters vote is the winning number to get striked out.

The contract includes the following methods,
- Join a game
- create your bingo card
- vote for a number
- see the round
- see the winning number of the round
- check if there is a winner, and
- restarting the game 

This is a Decentralized Bingo Game

it contains two files

- Voting.sol and
- Bingo.sol

While The Bingo file is responsible for the Details of the 5x5 card and striking out the voted number, Voting maintains the round and voting of which number to strike out.

![image](https://user-images.githubusercontent.com/72282249/197362311-e702e7d8-ef42-43a2-a43b-a5e0767118ce.png)

![image](https://user-images.githubusercontent.com/72282249/197362312-4bf78845-648d-4934-b039-a7ea5d1a1654.png)
