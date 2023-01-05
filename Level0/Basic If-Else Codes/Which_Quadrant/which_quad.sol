// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract whichQuadrant
{
    function quad( int _x, int _y) public pure returns ( int )
    {
        if ( _x > 0 ){
            if ( _y > 0 ){
                return 1;
            }
            else {
                return 4;
            }
        }
        if ( _x < 0 ){
            if ( _y > 0 ){
                return 3;
            }
            else {
                return 2;
            }
        }
    }
}