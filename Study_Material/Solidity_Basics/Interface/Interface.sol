// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.7;

interface Parent {
 // string public str;
 //   address public manager;


 //   constructor(){
 //       str= "Hello World";
 //       manager= msg.sender;
 //   } 
    


function setter(string memory _str) external;
}
contract Child is Parent{
    function setter(string memory _str) public override{
        
    }
}
