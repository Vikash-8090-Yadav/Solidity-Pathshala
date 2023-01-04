// SPDX-License-Identifier: MIT
pragma solidity 0.8.0;

contract DiscountedPrice{
    uint public markedPrice ;
    string public Discount ; 
    //Function for getting the marked price of the good
    function getMarkedPrice( uint _price ) public {
        markedPrice = _price ; 
    } 
    //Function for deciding the Discount 
    function decideDiscount( ) public payable returns( string memory ){
        string memory dis20 = "20%";
        string memory dis10 = "10%";
        string memory dis5 = "5%";
        if (markedPrice > 10000) {
            Discount = dis20 ; 
            return Discount ; 
        } else if ( markedPrice < 5000 ){
            Discount = dis5 ;
            return Discount ;
        } else if ( markedPrice > 5000 ){
            if ( markedPrice < 10000 ){
                Discount = dis10 ; 
                return Discount ;
            }
        }
    }
}