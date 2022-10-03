# Smart Contract "Wallet" in Remix-IDE

MultiSignWallet is a solidity smart contract which allows users to receive and send tokens to different users. It is a wallet contract which multiple users in it, so in order to do a transaction all the users needs to sign the transaction.

The SPDX License List Specification is a list of common licenses used in free and open or collaborative software.

Also Pragma specifies the version of Solidity used.

## Functions and there uses :-

- <code>constructor</code>: function which will run only once when the contract is being deployed. It has two parameters which takes addresses of the owners and set the number of owners that are required in order to do a transaction.

- <code>receiver</code>: function to receive ethers from other wallets.

- <code>submit</code>: function that runs whenever a transaction needs to be made, it sends the application to all the users to give there approval in order to do a transaction.

- <code>approve</code>: function that runs whenever the users needs to approve there transactions.

- <code>_getApprovalCount</code>: function that gives the count of the number of users that has approved a transaction.

- <code>execute</code>: function that runs when the required number of users has approved the transaction to transfer the tokens to the designated address.

- <code>revoke</code>: function that is used to cancel a transaction after it has been approved by the users in case of an urgency, before the transaction gets executed.


## Live running view



https://user-images.githubusercontent.com/74231771/193506163-d78198f7-afda-4fa6-830b-6793c237c65e.mp4

