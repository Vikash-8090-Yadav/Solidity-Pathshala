# Simple Auction Smart Contract 
Users allows to bid and withdraw on this smart contract

* users can bid with calling bid function
* Contract owner can see who is the highest bid and transfer money to previous highest bidder
* Contract owner can see the auction end time 

## Brief introduction about the code 
 
 1. bid() function is used to allow users to bid 
 
 2. withdraw() function is used to withdraw the amount of previous highest bidder
 
 3. auctionEnd() function is used to know auction ends or not.
 
 4. In the code block.timestamp means it indicates time of the block created.
 
 5. AuctionEndTime is equal to block.timestamp+biddingTime(you are going to give the bidding time when you are going to deploy the Contract
 
 6. When the AuctionTime Ends, there is no bidding 
 
 7. we used events which contains HighestBidIncreased it store Highestbid amount and who is the bidder(Address) 
 
 8. we used AuctionEnd event which contains BidWinner address and amount
 
 ### Compilation of the Contract
 ![Screenshot from 2022-10-01 01-31-22](https://user-images.githubusercontent.com/55663050/194279020-c01c5332-27dd-4e6e-ad4b-aad938812746.png)
 
 ### Deploy the Contract
 Before pressing the deploy button , we should give the benificary address and bidding Time must .
  ![Screenshot from 2022-10-01 01-31-22](https://user-images.githubusercontent.com/55663050/194279366-609676c3-ed12-427a-9044-7032bb233b8c.png)
  
 ## Bidding and higest bidding amount and highest bidder address
  ![Screenshot from 2022-10-01 01-31-22](https://user-images.githubusercontent.com/55663050/194279751-588495ac-5943-4fd8-a71e-9c34facd6e4a.png)
  
  
 
 
 
