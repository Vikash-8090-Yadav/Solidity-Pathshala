//SPDX-License-Identifier: Unlicense
pragma solidity >=0.5.0 <0.9.0;

//SPDX licence is introduced in Solidity 0.6.8. As a result, you must use SPDX-License-Identifier in the code.
 
contract evnentOrganization{
 
    //Here struct is used because They are useful for grouping together related data.
    struct Event{
        address organizer;
        string name;
        uint date;
        uint price;
        uint maxTickets;
        uint ticketRemain;
    }
        
    //Mapping is used in this case to store a Multiple number of events.
    mapping(uint=>Event) public events;
    
    //This is Nested Mapping, which is used to allow multiple users to participate in multiple events.
    mapping(address=>mapping(uint=>uint)) public tickets;
    uint public nextId;
 
    //It will initiate the event (The event will be created by the organiser.)
    function createEvent(string memory name,uint date,uint price,uint maxTickets) external{
        // Require is used to determine whether or not the condition is satisfied
    require(date>block.timestamp,"You can organize event for future date");
    require(maxTickets>0,"You can organize event only if you create more than 0 tickets");
    events[nextId] = Event(msg.sender,name,date,price,maxTickets,maxTickets);
    nextId++;
    }
 
    //This is the Payable function for buying event tickets.
    function buyTicket(uint id,uint quantity) external payable{
    require(events[id].date!=0,"Event does not exist");
    require(events[id].date>block.timestamp,"Event has already occured");
    Event storage _event = events[id];
    require(msg.value==(_event.price*quantity),"Ethere is not enough");
    require(_event.ticketRemain>=quantity,"Not enough tickets");
    _event.ticketRemain-=quantity;
    tickets[msg.sender][id]+=quantity;
    }
}
