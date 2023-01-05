// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract WhichDay{
    uint public DayNum ;
    string public Day ;
    //Function for getting thr day number by user
    function getnum( uint _x) public {
        DayNum = _x ;
    }
    //Function for getting day 
    function getDay() public payable returns( string memory){
        string memory day1 = "Monday";
        string memory day2 = "Tuesday";
        string memory day3 = "Wednesday";
        string memory day4 = "Thursday";
        string memory day5 = "Friday";
        string memory day6 = "Saturday";
        string memory day7 = "Sunday";
        if ( DayNum == 1 ){
            Day = day1 ;
            return Day ;
        } else if ( DayNum == 2){
            Day = day2 ;
            return Day ;
        } else if ( DayNum == 3 ){
            Day = day3 ;
            return Day ;
        } else if ( DayNum == 4 ) {
            Day = day4 ;
            return Day ;
        } else if ( DayNum == 5 ) {
            Day = day5 ;
            return Day ;
        } else if ( DayNum == 6 ) {
            Day = day6 ;
            return Day ;
        } else if ( DayNum == 7 ) {
            Day = day7 ;
            return Day ;
        } else {
            Day = "Not Valid";
            return Day ;
        }
    }
}