// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract FindAverage {
   function average(int256 a, int256 b, int256 c) public pure returns(int256){
        //require only continues when the condition inside is met, 
        //if condition is not met then it throws an error
        require(a>0,""); 
        require(c>0,""); 
        require(b>0,"");

        return (a+b+c)/3;
   }
}
