// SPDX-License-Identifier: aIT
pragma solidity >=0.5.0 <0.9.0;

contract SumOfDigits {

    function digitSum(int256 n) public pure returns(int256){
        //require only continues when the condition inside is met, 
        //if condition is not met then it throws an error
        require(n>0,"");
        int256 sum = 0;
        
        while(n>0){
            sum = sum + n%10; //We store the remainder in sum
            n = n / 10;       // and then divide the original number by 10
        }
        return sum;
    }    
}
