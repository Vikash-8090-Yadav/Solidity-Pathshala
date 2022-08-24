# Smart Contract "sendToEther" in Remix-IDE

 A smart contract  which is used to send ether from one account to the other. This smart Contract alows us to payto another contract, fetch balance and also gives the address of the payable user.

## Getting Started :


### Step 1:

For opening the remix-ide in browser type: https://remix.ethereum.org/.

A screen will be presented like the following:
![File explorer](https://user-images.githubusercontent.com/95535448/182686591-5ae38b05-1ea2-4532-9ee1-d368a43de36b.png)

Click on the “file explorer” icon onto the left side bar.

Select Solidity in the Environment and click + symbol right to the browser.

Type the file name and enter the respective code into it.

Step 2:

Now compile the SendToether.sol file,

![CompileSendTo_Ether sol](https://user-images.githubusercontent.com/95535448/182689470-67811d67-52d8-45b2-95d1-125000e08b29.png)

Step 3:
Once compiled successfully, click “Deploy and run transactions”. and "Deploy" it ,

![Deploy](https://user-images.githubusercontent.com/95535448/182689529-646ab6e7-ce0c-4486-886e-413f41a96f21.png)

Step 4:
And here you can see the all the transactions and deployed contracts-

![Deployed contracts](https://user-images.githubusercontent.com/95535448/182689765-b55a8166-3804-4466-9d4d-494db6e8e605.png)

Step 5:
Deploy the contract and then open this section 
Click on check balance to check your contract balance, It will show 0 for now.

2> Go to select the value to 10 and come down and select the payether function
This shall pay 10 ethers to your smart contract.

3> Now, checkbalance you will notice that now It says 10 ethers. Which is great lets move on.
Select another account now like this -> 
and you can replace this by the one declared as friend address in the contract just to verify :)

4> Now click on -> 
This shall transfer 5 ethers out of 10 from your contract to your choosen account and you shall have something like this in the transaction status.










