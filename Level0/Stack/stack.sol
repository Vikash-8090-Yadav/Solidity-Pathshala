// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract stack{

    int[] public nums;
   
    function push(int num) public {
        nums.push(num);
    }

    function getSize() view public returns(uint256){
        uint256 sz = nums.length;
        return sz;
    }

    function top() view public returns(int){
        uint256 sz = nums.length;
        if (sz == 0)
        {
            return -1;
        }
        return nums[sz - 1];
    }

    function pop() public returns(int){
        int ans = top();
        if (ans == -1)
        {
            return ans;
        }
        nums.pop();
        return ans;
    }
}
