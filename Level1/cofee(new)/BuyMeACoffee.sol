//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract BuyMeACoffee {
    //Event to emit when a Memo created.
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    //Memo struct
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }

    //List of all Memo's received from friends
    Memo[] memos;

    //Address of contract deployer
    address payable owner;

    //Deploy logic
    constructor() {
        owner = payable(msg.sender);
    }

    // @dev this function changes the owner of the contract so that tips can be collected by the new owner.
    // @param _newOwner address of the new owner
    function changeOwner(address payable _newOwner) public {
        
        require(msg.sender == owner, "Only Owner can elect new Owner");
        owner = _newOwner;
    }

    // @dev this function creates a new memo and adds it to the list of memos.
    // @param _name name of the person who sent the memo
    // @param _message message of the memo
    function buyCoffee(string memory _name, string memory _message) public payable {
        require(msg.value >0, "Can't buy coffee with 0 Eth");

        memos.push(Memo(msg.sender, block.timestamp, _name, _message));

        emit NewMemo(msg.sender, block.timestamp, _name, _message);
    }

    // @dev this function returns the total amount of tips collected by the contract and sends it to the owner.
    function withdrawTips() public {
        require(owner.send(address(this).balance));
    }

    // @dev this function returns a list of all memos received from friends.
    function getMemos() public view returns(Memo[] memory){
        return memos;
    }
}