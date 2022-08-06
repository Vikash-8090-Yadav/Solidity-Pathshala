// SPDX-License-Identifier: aIT
pragma solidity >=0.5.0 <0.9.0;

contract SumOfDigits {

    function digitSum(int256 n) public pure returns(int256){
        require(n>0,"");
        int256 sum = 0;
        while(n>0){
            sum = sum + n%10;
            n = n / 10;
        }
        return sum;
    }    
}