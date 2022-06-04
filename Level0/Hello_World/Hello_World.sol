// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract HelloWorld{
    // Simple programme for the hellow world 
    // function hello() pure  public returns (string memory){
    //     return "Hello World";
    // }
    
    //  using state variable's   
    string s = "Hello world2";
    function hello () view public returns (string memory){
        return s;
    }
}