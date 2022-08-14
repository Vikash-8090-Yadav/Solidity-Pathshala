# Smart Contract "Coin"

#### With the help of this smart contract you can send coins to other people, The contract allows only its creator to mint new coins.
Anyone can send coins to each other without the need of registering (with a username and password) all you need is a ethereum keypair.

![Functions](https://user-images.githubusercontent.com/95535448/183260538-92b3220b-e0fd-4cdc-8a2d-1474dde817ae.png)

Funtions in the smart contract
- mint: With this function we can mint coins by adding address and amount(only the creator can do this, if we put any other address other then the owners the contract will give error). 
- send: With this function we can send coins to other person (we need to add the receivers account address and the amount we want to send).
- balance: This function shows the balance of an account (if you input the address of the sender or the receiver you will get there account balance).
- minter: This function shows the minter's address i.e owners address.
