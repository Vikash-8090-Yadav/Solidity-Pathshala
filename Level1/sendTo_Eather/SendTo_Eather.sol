// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract sendEather{
    // any address to whom u want to send the faucet
    address payable user = payable(0xfbb83C2a1192dDf082d231b430052B195aCB6aED);

    function payto_contract() payable public{
    }

    function fetchbalance() view public returns(uint){
        return address(this).balance;
    } 


    function getaddre() view  public returns(address){
        return user;
    }

    function send1() public  {
        user.transfer(3 ether);
    }

}