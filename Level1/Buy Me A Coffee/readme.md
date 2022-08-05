# Smart Contract "Buy Me A Coffee"

#### With the help of this smart contract, users can send ether to the owner of the contract along with their name and message.

You can connect this smart contract with front-end to make a dapp that allows users to buy coffee for the owner using eth.

![Remix Screenshot
](https://github.com/AyushPathak3011/Solidity-Pathshala/blob/coffee-contract/Level1/Buy%20Me%20A%20Coffee/Remix-Contract.png?raw=true)

Functions in the smart contract
- changeOwner: This function is called if the owner wants to transfer the ownership of this contract.
- buyCoffee: This is a payable function and it also stores the name, message, timestamp in the memos array
- withdrawTips: This function returns the total amount of tips collected by the contract and sends it to the owner.
- getMemos: This function returns all the memos stored in the array.
