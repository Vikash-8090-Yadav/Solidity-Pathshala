# Dutch Auction

This contract Seller of NFT deploys this contract setting a starting price for the NFT. Auction lasts for 7 days. Participants can buy by depositing ETH greater than the current price computed by the smart contract. Auction ends when a buyer buys the NFT.
![DutchAuction1](https://user-images.githubusercontent.com/95535448/195981651-2f9dc75f-39a8-4444-ad47-e95130c612c6.png)

![Screenshot 2022-10-15 161321](https://user-images.githubusercontent.com/95535448/195982296-66c10571-8ffa-4039-bf61-f030515cc594.png)


## Functions and there uses :-

- <code>buy</code>: function allow us to buy the nft.

- <code>expiresAt</code>: function tells us the time at which auction will expire.

- <code>nft</code>: function tells us the address of the nft.

- <code>nftId</code>: function tells us the Id of the nft(which was assigned to it at the starting of the auction).

- <code>Seller</code>: function tells us the address of the seller.

- <code>StartAt</code>: function tell us the time at which auction will start.

- <code>StartingPrice</code>: function tells us the starting price of the product(nft) which was decided at the starting of the auction.

- <code>Winner</code>: function tell us the address of the auction winner.

