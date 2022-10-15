# Dutch Auction

This contract Seller of NFT deploys this contract setting a starting price for the NFT. Auction lasts for 7 days. Participants can buy by depositing ETH greater than the current price computed by the smart contract. Auction ends when a buyer buys the NFT.
![DutchAuction1](https://user-images.githubusercontent.com/95535448/195981651-2f9dc75f-39a8-4444-ad47-e95130c612c6.png)

![Screenshot 2022-10-15 161321](https://user-images.githubusercontent.com/95535448/195982296-66c10571-8ffa-4039-bf61-f030515cc594.png)


## Functions and there uses :-

- <code>buy</code>: function which will run only once when the contract is being deployed. It has two parameters which takes addresses of the owners and set the number of owners that are required in order to do a transaction.

- <code>expiresAt</code>: function to receive ethers from other wallets.

- <code>nft</code>: function that runs whenever a transaction needs to be made, it sends the application to all the users to give there approval in order to do a transaction.

- <code>nftId</code>: function that runs whenever the users needs to approve there transactions.

- <code>Seller</code>: function that gives the count of the number of users that has approved a transaction.

- <code>StartAt</code>: function that runs when the required number of users has approved the transaction to transfer the tokens to the designated address.

- <code>StartingPrice</code>: function that is used to cancel a transaction after it has been approved by the users in case of an urgency, before the transaction gets executed.
- <code>Winner</code>: function that is used to cancel a transaction after it has been approved by the users in case of an urgency, before the transaction gets executed.

