// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

//reversing an array
contract ReversingAnArray {
    function reverseArray(uint256[] memory arr) public pure returns (uint256[] memory) {
        //create a new array with the same length as the original array
        uint256[] memory reversed = new uint256[](arr.length);

        //loop through the original array and assign the values to the new array in reverse order
        for (uint256 i = 0; i < arr.length; i++) {
            // assign the value of the original array to the new array in reverse order
            reversed[i] = arr[arr.length - 1 - i];
        }
        return reversed;
    }
}