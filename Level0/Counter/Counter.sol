// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.4;

contract Counter
{
    //address of the owner 
    address private owner;
    constructor()
    {
        //owner of the smart contract
           owner=msg.sender;
    }
    //creating onlyOwner modifer to provide security
    modifier onlyOwner() 
   {
    require(isOwner(),
    "Function only access to owner");
    _;
   }
  //returns true if owner access otherwise false
  function isOwner() public view returns(bool) 
  {
    return msg.sender == owner;
  }
   int private counter=0;
   //increment function
   function increment() onlyOwner public{
       counter+=1;
   }
   //decrement function
   function decrement() onlyOwner public{
       counter-=1;
   }
   //get count function
   function getCount() onlyOwner public view returns(int)
   {
       return counter;
   }
}
