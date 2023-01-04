// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract getMIN
{
    function get_min( uint _x, uint _y) public pure returns ( uint )
    {
        if ( _x > _y )
        {
            return _y;
        }
        else if ( _x < _y )
        {
            return _x;
        }
        else 
        {
            return 0;
        }
    }
}