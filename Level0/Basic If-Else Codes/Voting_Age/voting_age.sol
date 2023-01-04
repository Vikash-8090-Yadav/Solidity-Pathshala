// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract VotingAgeLimit{
    uint public Age ;
    bool public Valid ;
    //function for checking the age 
    function Check_Age_Limit( uint _x ) public payable returns( bool ){
        Age = _x ;
        if (Age >= 18){
            Valid = true ;
            return Valid; 
        } else {
            Valid = false ;
            return Valid ;
        }
    }
}