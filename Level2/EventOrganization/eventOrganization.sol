// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity >= 0.5.0 <0.9.0; // solidity version should be greater 0.5.0 and less than 0.9.0

contract EventContract { 
    // struct is just like classes in javascript which provides blueprint
    struct Event{ 
        address organiser; // address of organiser
        string  name;// Event name
        uint date; // Date of the event
        uint price; // ticket price for the event
        uint ticketCount; // Available Ticket Counts
        uint ticketRemain; // Remaining tickets which are available
    }
    // we want to create multiple events by single hence we will be using mapping
    mapping(uint=>Event) public events; // each and every (uint)index is mapping to a event
    mapping(address=>mapping(uint=>uint)) public tickets; // a nested mapping which is holding tickets for reach event
    uint public nextId; // id for events

    // below function will create event 
    function createEvent(string memory name, uint date, uint price, uint ticketCount) external {
        require(date > block.timestamp , "you can organise event for future date"); // the date we are choosing for event should be greater than current time so that noone can make fake events
        require(ticketCount>0, " You dont have enough tickets for auidence you can organize event");

        events[nextId] = Event(msg.sender,name,date,price,ticketCount,ticketCount); // mapping of event to nextId + the orgaziser need to give information about event we are using ticketCount 2x cause when we create event ticket count and remaining tickets will be same
        nextId++;    // increase nextId so can next event can be mapped to another index
    }

    function buyTicket(uint id, uint quantity) external payable{
        require(events[id].date!=0, "This event does not exist"); // this event should exist
        require(block.timestamp < events[id].date,"Event does not exist ");
        Event storage _event = events[id]; // to store which tickets user have bought
        require(msg.value==(_event.price*quantity), "More money is required to buy tickets"); 
        require(_event.ticketRemain>=quantity, "Not enough tickets available");// enough tickets should be availabel
        _event.ticketRemain-=quantity; // if every condition satisfies then sell those tickets
        tickets[msg.sender][id]+=quantity; // will store particular users ticke count
    }

    function transferTicket(uint eventId, uint quantity, address to) external{
        require(events[eventId].date!=0, "This event does not exist"); // this event should exist
        require(block.timestamp < events[eventId].date,"Event does not exist ");
        require(tickets[msg.sender][eventId]>= quantity, "you do not have enough tickets to transfer");
        tickets[msg.sender][eventId]-=quantity; // reducing ticket from sender
        tickets[to][eventId]+=quantity; // adding tickets to reciever
    }


}