// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract ScoreCard{
    uint public percentage ;
    string public grade ;
    //Function for checking the grade at the percentage 
    function giveGrades( uint _percent ) public payable returns( string memory ){
        string memory gradeA = 'A';
        string memory gradeB = 'B';
        string memory gradeC = 'C';
        string memory gradeD = 'D';
        string memory gradeE = 'E';
        percentage = _percent ;
        if (percentage >= 90 ){
            grade = gradeA ;
            return grade ;
        } else if ( percentage >= 80 ){
            grade = gradeB;
            return grade ;
        } else if ( percentage >= 70 ){
            grade = gradeC ;
            return grade ;
        } else if ( percentage >= 60 ){
            grade = gradeD;
            return grade ;
        } else {
            grade = gradeE ;
            return grade ;
        }
    }
}