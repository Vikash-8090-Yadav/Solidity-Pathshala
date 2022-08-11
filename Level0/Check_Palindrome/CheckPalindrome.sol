// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract CheckPalindrome {

    function palindrome(uint256 n) public pure returns (uint256) {
        uint256 reversed = 0;
        uint256 remainder;
        uint256 original;
        original = n;

        //Here we are reversing original number
        while (n != 0) {
            remainder = n % 10; //We find the remainder and store it in the reversed
            reversed = reversed * 10 + remainder; //We then multiply by 10 to shift the position
            n /= 10;
        }

        //Here we check if original number is equal to the reversed number
        if (original == reversed) {
            return 1; //palindrome
        } else {
            return 0; //not palindrome
        }
    }   
}
