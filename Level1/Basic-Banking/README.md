# Basic Banking Smart Contract Creation

Today we will see how to create  a banking smart contract with basic features

## This smart contract will have all basic functionalities like ,

<li>
Account Creation
</li>
<li>
Deposite Amount
</li>
<Li>
Withdraw amount
</li>
<li>
Transfer Amount
</li>
<li>
Send Amount to wallet
</li>

# code 
![Screenshot from 2022-10-22 18-02-45](https://user-images.githubusercontent.com/105157723/197339212-0dcefb62-f760-41bf-bd95-a4d09dfe2c5a.png)



# Basic function used 


## First need to add solidity compiler version

`
// SPDX-License-Identifier: MIT
pragma solidity  >=0.4.22 <0.7.0;
`

##  createAcc() functions :
`Here we create user account using boolean method by making userExists mapping true after using createAcc() function `

## deposit() function
`With the help of userExists mapping we are only allowing registered users to deposit into our Smart Contract Bank .`

## withdraw(uint amount) function

`With the help of this function user can withdraw the money`

## TransferAmount() function

`Here TransferAmount function transfers amount from one account to other account in the bank only and both users must have 
created account on the bank to use this function`

## sendAmount() function 

`Here sender's amount will be transfered from account in the bank to othe receiver's wallet`


