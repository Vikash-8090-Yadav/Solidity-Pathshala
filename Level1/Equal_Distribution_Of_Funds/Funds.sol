// SPDX-License-Identifier: Unlicensed

pragma solidity ^0.8.7;

contract FundDistribution{
    // owner or dad of the funds
    address owner;
    event LogKidFundingReceived(address walletAddress , uint amount, uint contractBalance);

    constructor(){
        owner = msg.sender; // owners account
    }
      struct Kid {
          address payable walletAddress; // kids address
          string firstName; // his first name
          string lastName; // his last name
          uint releaseTime; // when he will get funds
          uint amount; // the amount he will get 
          bool canWinthdraw; // if he can withdraw or not 
      }

        // define kids or beneficiars
      Kid[] public kids; // to store multiple kids or beneficiars

      // using modifier so that w dont have to write same line of code again and again
      modifier onlyOwner(){
        require(msg.sender == owner, "Only owner can send this");
            _;
        }

        // add kids or beneficiars to contract
      function addKid( // basic info storing in array of kids
        address payable walletAddress,
        string memory firstName, 
        string memory lastName, 
        uint releaseTime,
        uint amount,
        bool canWithdraw) public onlyOwner {
          kids.push(Kid(
              walletAddress,
              firstName,
              lastName,
              releaseTime,
              amount,
              canWithdraw
          ));
      }
       // to check balance of contract
        function balanceOf() public view returns(uint){
            return address(this).balance;
        }

       // deposite funds to contract so that we can distribute it to kids or beneficiars
        function deposit(address walletAddress) payable public{
            addToKidsBalance(walletAddress);
        }

        // sending balance to kids
        function addToKidsBalance(address walletAddress) private {
            for(uint i = 0 ; i< kids.length;i++){
                if(kids[i].walletAddress == walletAddress){
                    kids[i].amount += msg.value;
                    emit LogKidFundingReceived(walletAddress,msg.value, balanceOf());
                }
            }
        }
    
        // toget index of kid
        function getIndex(address walletAddress) view private returns(uint){
            for(uint i = 0 ; i< kids.length;i++){
                if(kids[i].walletAddress == walletAddress){
                    return i;
                }
            }
            return 999;
        }

    // kids or beneficar checks if they can withdraw funds
    function availabletToWithdraw(address walletAddress) public returns(bool){
        uint i = getIndex(walletAddress);
        require(block.timestamp > kids[i].releaseTime, "you cant withdraw yet");
        if(block.timestamp > kids[i].releaseTime){
            kids[i].canWinthdraw = true;
            return true;
        }else{
            return false;
        }
    }

    // withdraw function which actually withdars money
    function withdraw(address payable walletAddress) payable public{
        require(msg.sender == walletAddress , "Please enter valid wallet address");
        uint i = getIndex(walletAddress);
        require(kids[i].canWinthdraw == true, "you cant withdraw right now");
        kids[i].walletAddress.transfer(kids[i].amount);
    }
}