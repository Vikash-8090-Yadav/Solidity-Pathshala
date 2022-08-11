// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0; // declaring version pragma that is the compiler version to be used for
                                // by the compiler so that the code does not break while using some other compiler

contract greeting{  // contract is just like a class and is deployed over the bloackchain
    string greet;

    // memory variables are the ones that are not permanently stored and are temporary
    constructor(string memory _greetings){  // declaring default constructor to initialize the variable
        greet=_greetings;
    }
    function set_greet(string memory _greet) public { // declaring a public function to assign greet a value
        greet = _greet;
    }
    function get_greet() view  public returns(string memory){ //a view function can only be viewed and not modified
        //public functions can only be accessed within the contract

        return greet; // returning the variable
    }
}