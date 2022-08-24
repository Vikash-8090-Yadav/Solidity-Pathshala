# Smart Contract "Wallet" in Remix-IDE


## Getting Started :


### Step 1:

For opening the remix-ide in browser type: https://remix.ethereum.org/.

A screen will be presented like the following:
![File explorer](https://user-images.githubusercontent.com/95535448/182686591-5ae38b05-1ea2-4532-9ee1-d368a43de36b.png)

Click on the “file explorer” icon onto the left side bar.

Select Solidity in the Environment and click + symbol right to the browser.

Type the file name and enter the respective code into it.

Step 2:

Now compile the Voting.sol file,
![compile](https://user-images.githubusercontent.com/95535448/182790166-d579baf4-16f6-4924-b0d3-3891119f1561.png)

Step 3:
Once compiled successfully, click “Deploy and run transactions”. and "Deploy" it ,
![deploy](https://user-images.githubusercontent.com/95535448/182790432-3c5bff42-5e2b-4d49-baf0-e6cdc2260922.png)

Step 4:
And here you can see the all the transactions and deployed contracts-
![deployed contracts](https://user-images.githubusercontent.com/95535448/182790663-beb4c612-e4fd-4f44-8cd4-e3caa2f0a05d.png)

Step 5:
Functions used and Objectives implemented in wallet smart contract->

1> Createation of a public payable state variable by the name of owner to store the address of the owner.

2> constructor ( ) - It will take one argument to initialise the owner of the contract.

3> deposit ( ) - To deposit ether to contract balance.

4> sendEther ( ) - It will take two arguments. First the address of the receiver to whom we want to send the amount to. Second the amount(uint) that we want to send.

    a) This function must be called by the owner of the contract. Otherwise, it should print "sender is not allowed". [Hint - Use require]

    b) If the owner of the contract has called this function then transfer the ether to the receiver's address.

5> balanceOf ( ) - To return the balance of the contract
