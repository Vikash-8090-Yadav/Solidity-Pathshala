//creating a smart contract where the people are going to contribute in a project initiated by a manager, where the manager can only draw the money from the contract with DAO automation
// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.6.0 <0.9.0;
contract CrowdFund{
     
      //variables 
      mapping(address=>uint) public contributors;
      address public manager;
      uint public minimumContribution;
      uint public deadline;
      uint public target;
      uint public raisedAmount;
      uint public noOfContributors;

       //description of the project by manager
       struct  Request{
          string description;
          address recipient;
          uint value;
          bool completed;
          uint noOfVoted;
          mapping(address=>bool) voters;
      }

      //list of projects initiated by manager
      mapping(uint=>Request) public requests;
      uint public numRequests=0;

      constructor(uint _target,uint _deadline){
        //block.timestamp->time passed till the block was created
        target=_target;deadline=block.timestamp+_deadline;//14sec + 3600sec
        minimumContribution=100 wei;
        manager=msg.sender;
      }

      function sendEth()public payable{
      
          require(block.timestamp<deadline,"Deadline has crossed");
          require(msg.value>=minimumContribution,"Minimum contribution is not met");
          if(contributors[msg.sender]==0){
              noOfContributors++;
          }
          contributors[msg.sender]+=msg.value;
          raisedAmount+=msg.value;

      }
      
      function checkBalance()public view returns(uint){
          return address(this).balance;
      }
      
      function refund()public{
          require(block.timestamp>deadline && raisedAmount<target,"Deadline not reached yet");
          require(contributors[msg.sender]>0);
          address payable user=payable(msg.sender);
          user.transfer(contributors[msg.sender]);
          contributors[msg.sender]=0;
          raisedAmount-=contributors[msg.sender];
      }
      
      
      modifier onlyManager(){
          require(msg.sender!=manager,"You are not the manager");
          _;
      }

      function createRequests(string memory _description,address payable _recipient,uint _value)public onlyManager{
        
         Request storage newRequest=requests[numRequests++];
         newRequest.description=_description;
         newRequest.recipient=_recipient;
         newRequest.value=_value;
         newRequest.completed=false;
         newRequest.noOfVoted=0;
         

      } 
      function voteRequest(uint _requestNo)public{
      
          require(contributors[msg.sender]>0,"You are not contributor");
          Request storage newRequest=requests[_requestNo];
          require(newRequest.voters[msg.sender]==false,"You have already ");
          newRequest.voters[msg.sender]=true;
          newRequest.noOfVoted++;
      }
}