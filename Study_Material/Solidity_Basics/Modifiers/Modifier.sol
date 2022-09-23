// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.7;

contract Req {
    address public owner;

    constructor() {
       owner=msg.sender;
    }

    modifier onlyowner() {
        require(owner==msg.sender, "You are not the owner");
        _;
    }

    function get10() public view onlyowner returns (uint) {
        uint a=10;
        string memory str="hello";

        return 10;
    }

    function get20() public view onlyowner returns (uint) {
        
        return 20;
    }

      function get30() public view onlyowner returns (uint) {
        
        return 30;
    }