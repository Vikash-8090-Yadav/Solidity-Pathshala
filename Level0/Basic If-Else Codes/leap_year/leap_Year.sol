// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract leapYear{
    uint public Year;
    //Function for leap year 
    function check_leap( uint _yr ) public payable returns ( uint ){
        Year = _yr ;
        if (Year % 4 == 0) {
            if ( Year % 100 != 0 ){
                return 1;
            }
        } else {
            return 0 ;
        } 
    }
}