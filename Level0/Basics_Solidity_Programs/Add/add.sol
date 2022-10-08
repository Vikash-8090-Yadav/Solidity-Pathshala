// SPDX-License-Identifier: MIT
pragma solidity 0.6.0;
contract sum_of_num{
    int public num1;
    int public num2;
    int public sum;
    //Function for sum of two numbers
    // Write Function - Where we change the blockchain - They require Gas 
    function add(int a, int b) public 
    {
        num1 = a ;
        num2 = b ;
        sum = num1 + num2;
    }
    //Function for printing sum of two numbers
    // Read Function - Requires no Gas
    function print_sum() public view returns ( int )
    {
        return sum ; 
    }
}