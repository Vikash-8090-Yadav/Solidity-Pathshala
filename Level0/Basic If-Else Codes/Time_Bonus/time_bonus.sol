// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract GiveTimeBonus{
    uint public time ;
    string public Bonus ;
    //Function for time worked by Employee 
    function GetTime( uint _yearsWorked ) public {
        time = _yearsWorked;
    }
    //Function for Deciding Bonus 
    //Basic salary for worker -> 10,000
    function DecideBonus() public payable returns( string memory ){
        string memory percent10 = "10%";
        string memory percent5 = "5%";
        string memory percent8 = "8%";
        if ( time > 10 ){
            Bonus = percent10 ; 
            return Bonus ;
        } else if ( time < 6 ){
            Bonus = percent5 ; 
            return Bonus ; 
        } else if ( time > 6 ){
            if ( time < 10 ){
                Bonus = percent8 ; 
                return Bonus ; 
            }
        }
    }
}