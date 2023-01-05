// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract check_even
{
    function even_odd( uint _num) public pure returns ( int )
    {
        if ( _num % 2 == 0 ){
            return 1;
        } else {
            return 0;
        }
    }
}