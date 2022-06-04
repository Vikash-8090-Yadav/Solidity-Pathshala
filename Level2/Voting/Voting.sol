// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract vote{
    address public  participant1 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2; 
    address public  participant2 = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;
    mapping(address=>uint) user;
    mapping(address=>bool) chek;

    address public owner;
    constructor(){
        owner = msg.sender;
    }

    modifier onlyonwner(){
        require(owner == msg.sender,"You are not allowed to declare the result");
        _;
    }

    function participant1_vote()  public {
        require(msg.sender !=participant1,"You can not vote to yourself");
        require(chek[msg.sender]!=true,"You have already voted");
        user[participant1]++;
        chek[msg.sender] = true; 
    }
        function participant2_vote()  public {
        require(msg.sender !=participant2,"You can not vote to yourself");
        require(chek[msg.sender]!=true,"You have already voted");
        user[participant2]+=1;
        chek[msg.sender] = true; 
    }

    function pati1_cnt_VOTE() view public onlyonwner returns(uint){
        return user[participant1];

    }

    function pati2_cnt_VOTE() view public onlyonwner returns(uint){
        return user[participant2];
        
    }

    function declare_winner() view public  onlyonwner returns(string memory){
        if(user[participant1]>user[participant2]){
            return ("Partcipant1 is wiiner !!");
        }
        else if(user[participant1]==user[participant2]){
            return("Both the participant are equal");
        }
        else{
            return ("Participant 2 is winenr");
        }  
    }

}