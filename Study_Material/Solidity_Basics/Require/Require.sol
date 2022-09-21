// SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.7;

contract Req {
    address public owner;
    constructor() {
       owner=msg.sender;
    }

    function get() public view returns (uint) {
        require(owner==msg.sender);
        return 10;
    }
}
