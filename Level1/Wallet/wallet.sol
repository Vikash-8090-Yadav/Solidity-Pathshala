// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract Wallet {
    //creating an array of accounts
    address payable[] public accounts;

    //owner's address
    address payable public owner;

    constructor(address _owner){
        //making owners address as payable
        owner = payable(_owner);

        //pushing owner address in accounts array
        accounts.push(payable(owner));
    }

    // To deposit balance to the smart contract
    function deposit() public payable {
        require(msg.value > 0, "Cannot deposit zero value");
        accounts.push(payable(msg.sender));
    }
    
    // Sending a specific 'amount' to the 'receiver'
    function sendEther(address reciever, uint amount) public payable{
        require(msg.sender== owner,"sender is not allowed");
        payable(reciever).transfer(amount);
    }

    // checking balance
    function balanceOf()  public view returns(uint){
        return address(this).balance;
    } 
}
