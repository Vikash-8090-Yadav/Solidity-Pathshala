// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

struct selling_item{
    string Name;
    uint   Id;
    uint   Cost;
    uint   Time;
}

contract shop{
    string[] buyer;
    mapping(uint=>string) itemlist; // this has been made to get the partcular name of the item through the id
    selling_item[] public  selling_items; // this is the object of the struct
    address seller; // address of the owner
    mapping(uint=>uint) cost; // This is used to map b/w the id and the cost .
    constructor(){
        seller = msg.sender;
    }

    modifier onlyonwner(){
        require(seller == msg.sender,"You are not allowed to do this ");
        _;
    }

    function AllItem(string memory _Name , uint _Id, uint _Cost)  public onlyonwner{
        itemlist[_Id] =_Name;
        cost[_Id] = _Cost;
        selling_items.push(selling_item(_Name,_Id,_Cost,block.timestamp));
    }   

    function buy(uint _Id)  public payable{
        uint n = cost[_Id];
        uint cost_ether=(n*10**18); // This is used to convert the amount into the ether
        require(cost_ether==msg.value,"Less sufficent amount");
        buyer.push(itemlist[_Id]);
    }
    function view_item() view  public returns(string[]memory){
        return buyer;
    }


}