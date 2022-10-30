// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

contract Dimentional{

    uint[5][5] public card;
    
    constructor(){
        
        // Bingo numbers 
        uint[25] memory nums;

        //filling the numbers 1..25
        for(uint i=1;i<=25;i++){
            nums[i-1]=i;
        }

        //shuffle the numbers
        for (uint i = 0; i < nums.length; i++) {
            uint256 n = i + uint256(keccak256(abi.encodePacked(block.timestamp))) % (nums.length - i);
            uint256 temp = nums[n];
            nums[n] = nums[i];
            nums[i] = temp;
        }

        //prepare the card wiht the shuffled numbers
        for(uint i=0;i<5;i++){
            for(uint j=0; j<5;j++){
                card[i][j] = nums[5*i+j];
            }
        }

    }

    function showCard() public view returns(uint[5][5] memory){
        // check if i and j are valid
        return card;
    } 

    function vote(uint v) public {
        for(uint i=0;i<5;i++){
            for(uint j=0; j<5;j++){
                if(card[i][j] == v){
                    // if match is found, crossout the number
                    card[i][j]=0;
                }
            }
        }
    }

}