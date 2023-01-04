// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract greattwoCheck
{
    function checkBig( uint _x, uint _y) public pure returns ( uint )
    {
        if ( _x > _y ){
            return _x;
        } else if ( _x == _y ){
            return 0;
        } else {
            return _y;
        }
    }
}