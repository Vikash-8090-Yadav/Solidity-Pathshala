// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract ReversingDigits {
    function reverseDigit(uint256 n) public pure returns (uint256) {
        uint256 reverse = 0;
        uint256 remainder;
        
        while (n != 0) {
            remainder = n % 10;
            reverse = reverse * 10 + remainder;
            n /= 10;
        }

        return reverse;
    }
}
