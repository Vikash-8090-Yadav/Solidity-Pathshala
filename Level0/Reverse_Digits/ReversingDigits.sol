// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract ReversingDigits {
    function reverseDigit(uint256 n) public pure returns (uint256) {
        uint256 reverse = 0;
        uint256 remainder;
        
        //Here we are reversing original number
        while (n != 0) {
            remainder = n % 10; //We find the remainder and store it in the reversed
            reverse = reverse * 10 + remainder; //We then multiply by 10 to shift the position
            n /= 10;
        }

        return reverse;
    }
}
