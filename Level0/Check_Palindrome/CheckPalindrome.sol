// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract CheckPalindrome {

    function palindrome(uint256 n) public pure returns (uint256) {
        uint256 reversed = 0;
        uint256 remainder;
        uint256 original;
        original = n;

        while (n != 0) {
            remainder = n % 10;
            reversed = reversed * 10 + remainder;
            n /= 10;
        }

        if (original == reversed) {
            return 1; //palindrome
        } else {
            return 0; //not palindrome
        }
    }   
}
