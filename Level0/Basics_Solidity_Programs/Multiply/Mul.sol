// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;
contract Product_of_num
{
    function get_product(int x, int y ) public pure returns ( int )
    {
        int num1 = x ;
        int num2 = y ;
        int product = num1 * num2 ;
        return product ;
    }
}