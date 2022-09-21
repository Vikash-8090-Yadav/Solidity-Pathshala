//SPDX-LICENSE-IDENTIFIER: UNLICENSED

pragma solidity 0.8.7;

contract Poly {
    function sum(uint a, unit b) public pure returns (uint) {
        return a+b;
    }

    function sum(uint a, uint b, uint c) public pure returns(uint){
        return a+b+c;

    }

     function sum (string memory a, string memory b) public pure returns(string memory){
        b="Hi";
        returns a;
        
    }

}
