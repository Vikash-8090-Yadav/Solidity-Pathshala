// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract moreThan10
{
    function getNum( int _num) public pure returns ( int )
    {
        if ( _num > 10 ){
            return 1 ;
        } else {
            return 0; 
        }
    }
}