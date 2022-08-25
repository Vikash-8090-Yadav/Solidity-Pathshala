// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract kamal{

    address payable friend = payable(0x02Ea6a1368d7E6B10462BfB996Df55f4DA67B75a);
    //this address can be taken from remix IDE (another acc address).
    
    function payether() public payable{}
    //payether function pays to the smart contract based on the time of deployment.

    function checkbalance() view public returns(uint){
        return address(this).balance/ 1 ether;
        //converting Wei to ether for code readability.
    }
    //checks the balance of smart contract.

    function payethertoacc() public{
        friend.transfer(5 ether);
    }
    //to transfer ether to another account.
}


