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
All the functions involved in the contract -> 

checkbalance - > check the balance of the smart contract

payether -> pay ether to the smart contract

payethertoacc -> pay ether to the account

##Step by step guide to the Contract
Deploy the contract and then open this section 

![Screenshot from 2022-08-24 13-36-37](https://user-images.githubusercontent.com/95926324/186368424-20295960-f42a-4ff5-9e9b-984086f270fe.png)

Click on check balance to check your contract balance, It will show 0 for now.

2> Go to

![Screenshot from 2022-08-24 13-41-20](https://user-images.githubusercontent.com/95926324/186368530-b74551f0-073d-4e79-8dc7-c79be8020345.png)

select the value to 10 and come down and select the payether function
This shall pay 10 ethers to your smart contract.

3> Now, checkbalance you will notice that now It says 10 ethers. Which is great lets move on.
Select another account now like this -> 
![Screenshot from 2022-08-24 13-43-42](https://user-images.githubusercontent.com/95926324/186368582-d4912d60-6796-4c6f-bb79-5cbb0feee437.png)

and you can replace this by the one declared as friend address in the contract just to verify :)

4> Now click on -> 

![Screenshot from 2022-08-24 13-45-05](https://user-images.githubusercontent.com/95926324/186368642-86059fd2-5a95-45ce-bcce-97be43c9d18a.png)

This shall transfer 5 ethers out of 10 from your contract to your choosen account and you shall have something like this in the transaction status.
![Screenshot from 2022-08-24 13-47-39](https://user-images.githubusercontent.com/95926324/186368727-f47e40f5-c1fa-4801-981c-357dbdb974ea.png)










