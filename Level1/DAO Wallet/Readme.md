# Smart Contract DAO Wallet (Multi Signature Wallet)

## Project Description

In a decentralized organization when a decision needs to be taken it is not solely depend on a single member but a group of people, and depending upon the votes of the majority of owners the decision is confirmed. In this contract I have implemented the similar conncept that is, to confirm the transaction we need to have an upvote of the majority of the owners.

## Project Function

# Modifiers:

1. onlyOwner- Checks whether the address is of the valid owners 
2. transactionExist- Checks whether the transaction exists in the map
3. notExecuted- A transaction will happen only if it is previously not executed
4. notConfirmed- Checks whether the transaction is confirmed or not.

# Function:

1. receive()- It will receives all the payments and store the transaction details on the Deposit event.
2. submitTransaction()- After the payment is done the transactions need to be submitted in the smart contract and it is pushed in the "transaction" array
3. confirmTransaction()- It will confirm the transaction when the votes are confirmed and add it in mapping .
4. executeTransaction()- It will accept the transactionId and check whether the number of votes is greater or equal to the required votes needed.
5. getOwners()- It wiil return the owners array
6. getTransactionCount()- Returns the total number of transactions.


## Contract Screenshots


![h8GGPCsRZl](https://user-images.githubusercontent.com/94303484/213843028-185761b6-309b-4f8f-96a7-4eaf03cca104.png)
![IHYdR3RiKw](https://user-images.githubusercontent.com/94303484/213843031-79600343-b560-410c-b6cd-9d5dc1184a26.png)

## Demo Video


https://user-images.githubusercontent.com/94303484/214220400-d71ec0b5-dc06-4d2d-868e-cb299262dc2f.mp4

