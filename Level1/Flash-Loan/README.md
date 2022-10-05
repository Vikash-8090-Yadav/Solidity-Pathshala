# Smart Contract "FlashLoan" in Remix-IDE

FlashLoan is a solidity smart contract which allows users to do arbitrage, lending from the aave pool.

The SPDX License List Specification is a list of common licenses used in free and open or collaborative software.

Also Pragma specifies the version of Solidity used.

## Dependencies required :-

- <code>FlashLoanSimpleReceiverBase</code>
- <code>IPoolAddressesProvider</code>
- <code>IERC20</code>

You need to install the ``` @aave/core-v3 ``` and then import the above lines of code in the contract.

## Functions and there uses :-

- <code>constructor</code>: function which will run only once when the contract is being deployed. It has one parameter which takes address of the provider contract and passes it to the FlashLoanSimpleReceiverBase contract and also set the owner of the contract to the address which deploys the contract.

- <code>receiver</code>: function to receive ethers from other wallets.

- <code>requestLoan</code>: function to execute the FlashLoan to happen.

- <code>getBalance</code>: function to get the balance of the contract before and after the loan executes.


## Live running view :-


https://user-images.githubusercontent.com/74231771/194019776-d21900e1-7dbf-4b78-983f-ec979bb5dba4.mp4
