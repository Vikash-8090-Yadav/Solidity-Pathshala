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

Now compile the wallet.sol file,

![image](https://user-images.githubusercontent.com/95926324/186484221-b0f0723a-430f-478e-8c7f-bf964faa9bce.png)


Step 3:
Once compiled successfully, click “Deploy and run transactions”. and put the address of the owner and click "Deploy"  ,

![image](https://user-images.githubusercontent.com/95926324/186484449-0b3bfd27-cd9d-4915-a714-db7fa024e136.png)

Step 4:
And here you can see the all the transactions and deployed contracts-

![image](https://user-images.githubusercontent.com/95926324/186484803-55411a4a-7653-43a6-9a98-56cac8062fed.png)

Step 5:
![image](https://user-images.githubusercontent.com/95926324/186483443-160f8b6d-7ed5-4e39-a353-a2ebcf376e27.png)

Functions used and Objectives implemented in wallet smart contract->

1> Createation of a public payable state variable by the name of owner to store the address of the owner.

2> constructor ( ) - It will take one argument to initialise the owner of the contract.

3> deposit ( ) - To deposit ether to contract balance.

4> sendEther ( ) - It will take two arguments. First the address of the receiver to whom we want to send the amount to. Second the amount(uint) that we want to send.

    a) This function must be called by the owner of the contract. Otherwise, it should print "sender is not allowed". [Hint - Use require]

    b) If the owner of the contract has called this function then transfer the ether to the receiver's address.

5> balanceOf ( ) - To return the balance of the contract
