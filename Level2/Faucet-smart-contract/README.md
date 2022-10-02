# Smart Contract "Faucet" in Remix-IDE

Faucet is a solidity smart contract which allows user to receive tokens. It gives tokens to the requested addresses present within the contract.

The SPDX License List Specification is a list of common licenses used in free and open or collaborative software.

Also Pragma specifies the version of Solidity used.

## Functions and there uses :-

- <code>constructor</code>: function which will run only once when the contract is being deployed. It has one parameter which takes address of the ERC20 tokens smart contract, whose interface is defined above.

- <code>requestTokens</code>: function which will send the tokens to the requested address after meeting all the required conditions.

- <code>receive</code>: function to send tokens to the faucet contract after its reserves gets filled.

- <code>getBalance</code>: function to get balance of the faucet contract.

-<code>withdraw</code>: function to withdraw all the tokens from the smart contract, can only be done by the owner.

## Live running view:-


https://user-images.githubusercontent.com/74231771/193423968-f25c04b2-4823-46f4-bd07-6c01465d22bd.mp4
