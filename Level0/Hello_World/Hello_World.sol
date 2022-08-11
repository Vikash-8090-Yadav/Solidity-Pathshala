// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0; // declaring version pragma that is the compiler version to be used for
                                // by the compiler so that the code does not break while using some other compiler


contract HelloWorld{ // contract is just like a class and is deployed over the bloackchain
    // Simple program for the hello world 
    // function hello() pure  public returns (string memory){
    //     return "Hello World";
    // }
    
    //  using state variable's  
    // The state varaibales are permamnently stored in the blockchain 
    string s = "Hello world2";
    function hello () view public returns (string memory){ //A view function can only be viewed and not modified
        //public functions can only be accessed within the contract

        return s; //returning the varibale holding the string
    }
}