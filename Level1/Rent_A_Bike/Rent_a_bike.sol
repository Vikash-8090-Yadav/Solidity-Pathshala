// SPDX-License-Identifier: MIT


pragma solidity ^0.8.0;

contract BikeChain{
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    // Add Renters(owner) 
    struct Renter{
        address payable walletAddress; // to pay rent fees
        string firstName; // the first name of the person who wants bike
        string lastName; // the last name of the person who wants bike
        bool canRent; // can they rent a bike or not?
        bool active; // are they active or not if they have taken your bike and havent returned yet then they will be active and vice versa
        uint balance; // they can send money to balance to cover the fees(deposit)
        uint due; // the Amount they have to pay
        uint start;// when they took the bike to ride?
        uint end; // when they returned the bike?
    }

    mapping (address => Renter) public renters;// we are mapping each renter by their address as it will not be good if we use array to store renters and renters no gets too large

    // This function will store value of renters
    function addRenter(
        address payable walletAddress,
        string memory firstName,
        string memory lastName,
        bool canRent,
        bool active,
        uint balance,
        uint due,
        uint start,
        uint end) public{
            renters[walletAddress]= Renter(walletAddress,
                                        firstName,
                                        lastName,
                                        canRent,
                                        active,
                                        balance,
                                        due,
                                        start,
                                        end);
        }

    // Checkout Bike
    function checkOut(address walletAddress) public{
        require((renters[walletAddress].due == 0),"Pay Your Bills First"); // renter cant get new bike until he submits old one
        require(renters[walletAddress].canRent == true,"Check in your old bike first"); // you can rent a bike
        require(renters[walletAddress].active == false,"Check in your old bike first");// renter need to submit his old bike before taking new one
        renters[walletAddress].active = true; // the guy who send the message with walletaddress he wants bike so we set his bike active to true
        renters[walletAddress].start = block.timestamp; // The current time when he rented the bike
        renters[walletAddress].canRent = false; // He already rented a bike he cant get a new bike

    }

    // Check In bike
    function checkIn(address walletAddress) public{
        require(renters[walletAddress].active == true, "Please Checkout bike first");
        renters[walletAddress].active = false; // now he dosent have a bike
        renters[walletAddress].canRent = true; //  he can rent a new bike
        renters[walletAddress].end = block.timestamp; // to finf total time of bike usage we will get end time by bike
        setDue(walletAddress); // set the amount due
    }


    // This function calaculated the total time renters bike usage
    function findTime(uint start, uint end) internal pure returns(uint){
        return end-start;
    }


    // Get Total duration of Bike Use
    function getTotalDuration(address walletAddress) public view returns(uint){
        require(renters[walletAddress].active == false,"Submit Bike first");
        uint timeSpan = findTime( renters[walletAddress].start,renters[walletAddress].end); // gets total duration
        return timeSpan;
    }

    // Get contract balance
    function balanceOf() view public returns(uint){
        return address(this).balance;  
      }

    // Get Renters balance
    function rentersBalance(address walletAddress) public view returns(uint){
        return renters[walletAddress].balance;
    }

    // Set Due Amount how much money per minute
    function setDue(address walletAddress) internal{
        uint timeSpanInMinutes = getTotalDuration(walletAddress);
        renters[walletAddress].due = timeSpanInMinutes * 5000000000000000; // 0.005 bnb in standard format
    } 

    // To check on front end if a user can rent a bike or not
    function canrentBike(address walletAddress)public view returns(bool){
        return renters[walletAddress].canRent;
    }

    // Deposit money for Assurance and also below function will automatically add the value send to contract balance
    function deposit(address walletAddress) payable public{
        renters[walletAddress].balance += msg.value; // Record their deposit amount
    }

    // Make payment 
    // This function is quite hard to get let me explain.
    // Suppose you deposit 10 ether and it will get store to smart contract balance + it will also recorded in your balance varibale in struct
    // Once you check in your total due amount will be calsulated that amount will be removed from your balance 
    // it shows that it no longer belongs to you it is money generated by smat contract deployer in short owner
    function makePayment(address walletAddress) payable public{
        require(renters[walletAddress].due > 0,"You do not have any due right now");
        require(renters[walletAddress].balance > msg.value,"You do not have enough money please deposit money");
        renters[walletAddress].balance -= msg.value; 
        renters[walletAddress].canRent = true;
        renters[walletAddress].due = 0 ;
        renters[walletAddress].start = 0;
        renters[walletAddress].end = 0;
        renters[walletAddress].active = false;
    } 
}