// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Wallet {
    address payable[] public accounts;
    //creating an array of accounts
    address payable public owner;
    //owner's address

    constructor(address _owner){
        owner = payable(_owner);
        //making owners address as payable
        accounts.push(payable(owner));
        //pushing owner address in accounts array
    }

    function deposit() public payable {
    }
    //to deposit balance to the smart contract

    function sendEther(address reciever, uint amount) public payable{
        require(msg.sender== owner,"sender is not allowed");
        payable(reciever).transfer(amount);
    }

    function balanceOf()  public view returns(uint){
        return address(this).balance;
    }
    //checking balance
}
