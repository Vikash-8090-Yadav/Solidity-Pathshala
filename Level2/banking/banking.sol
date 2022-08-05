// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract banking{

    mapping(address=>uint) public  user;
    address  public manager;
    
    constructor(){
        manager = msg.sender;
    }

    modifier onlyonwner(){
        require(msg.sender == manager,"You are not the owner of the smart contract");
        _;
    }

    // deposit to the contract from the user;

    function deposit() public payable returns(bool){
        require(msg.value >= 1 wei ,"The balance is insuffcient");
        user[msg.sender]+=msg.value;
        return true;
    }

    function withdraw(uint _amount) public returns(bool){
        require(user[msg.sender] >_amount,"U have the unsufficient balance");
        user[msg.sender]-=_amount;
        payable(msg.sender).transfer(_amount);
        return true;
    }
    // balance checking for the a/c of the user;

    function checkbalance() view public returns(uint){
        return user[msg.sender];
    }

    // owner

    function contract_balance() view  public onlyowner returns(uint){
        return address(this).balance;
    }

    function withdraw_all() public payable onlyowner returns(bool){
       payable(manager).transfer(contract_balance());
       return true;
    }

    // THis function is use to check the real account balance of the user. Not in the smart contarct 
    // but the Main account by which user sending to the  smart contract, 
    //The main a/c is : 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    function Check_real_account_balance() view public  onlyowner returns(uint){
        return msg.sender.balance;
    }
    

}
