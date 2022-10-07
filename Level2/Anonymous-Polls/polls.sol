// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

contract PollContract{
    struct Poll{
        uint256 id;
        string question;
        uint64[] results;
        bytes32[] options;
    }
    struct VoterData{
        uint256[] votedIds;
        mapping(uint256 => bool) votedMap;
    }
    
    Poll[] private polls;
    mapping(address => VoterData) private voters;
    
    event PollCreated(uint256 _pollId);
    
    
    function createPoll(string memory _question, bytes32[] memory _options) public {
        require(bytes(_question).length > 0, "Question required");
        require(_options.length > 1, "Minimum two options required");
        
        uint256 newId = polls.length;
        Poll memory newPoll = Poll({
            id : newId,
            question: _question,
            options: _options,
            results: new uint64[](_options.length)
        });
        polls.push(newPoll);
        emit PollCreated(newId);
    }
    
    function getPoll(uint256 pollId) external view returns(uint256, string memory, uint64[] memory, bytes32[] memory){
        require(pollId < polls.length, "Poll does not exist");
        return (
            polls[pollId].id,
            polls[pollId].question,
            polls[pollId].results,
            polls[pollId].options
        );
    }
    
    function acceptVote(uint256 _pollId, uint16 _vote) external{
        require(_pollId < polls.length, "Poll does not exist");
        require(voters[msg.sender].votedMap[_pollId] == false, "User's vote has already been accepted");
        require(_vote < polls[_pollId].options.length, "Invalid option");
        
        polls[_pollId].results[_vote] += 1;
        voters[msg.sender].votedIds.push(_pollId);
        voters[msg.sender].votedMap[_pollId] == true;
        
    }
    function getVoter(address _id) external view returns(address, uint256[] memory){
        return(
            _id,
            voters[_id].votedIds
        );
    }
    function getTotalPolls() external view returns(uint256){
        return polls.length;
    }
}