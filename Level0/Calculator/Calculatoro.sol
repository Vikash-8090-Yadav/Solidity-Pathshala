// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;
contract Calulator {
    int256 ans;

    function add(int256 a, int256 b) public {
        ans = a + b;
    }

    function sub(int256 a, int256 b) public {
        ans = a - b;
    }

    function mul(int256 a, int256 b) public {
        ans = a * b;
    }

    function div(int256 a, int256 b) public {
        require(b > 0, "The second parameter should be larger than 0");
        ans = a / b;
    }

    function getans() public view returns (int256) {
        return ans;
    }
}