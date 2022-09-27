// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0 ;
contract division 
{
    int public divisor ;
    int public dividend ;
    int public quotient ; 
    int public remainder ; 
    function do_division(int x,int y) public 
    {
        divisor =  x ;
        dividend = y ;
        quotient = y / x ;
        remainder = y % x ; 
    }
}