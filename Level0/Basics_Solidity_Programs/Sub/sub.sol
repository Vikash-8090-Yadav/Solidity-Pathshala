// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
contract Sub
{
    function get_sub( int x, int y ) public view returns ( int )
    {
        int num1 = x ;
        int num2 = y ;
        int result = x - y ;
        return result ;
    }
}