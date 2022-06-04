// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract greeting{
    string greet;


    constructor(string memory _greetings){
        greet=_greetings;
    }
    function set_greet(string memory _greet) public {
        greet = _greet;
    }
    function get_greet() view  public returns(string memory){
        return greet;
    }
}