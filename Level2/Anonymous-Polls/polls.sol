// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.9;

contract PollContract{
    // A structure representing a Poll.
    struct Poll{
        uint256 id;         // ID of the poll
        string question;    // Question string
        uint64[] results;   // Integer array for number of votes to each option
        string[] options;   // String array of each option in the poll
    }

    // A structure for storing a voter's data
    struct VoterData{
        uint256[] votedIds;                 // IDs of all polls that this voter has voted in
        mapping(uint256 => bool) votedMap;  // Mapping from Poll ID to voted/not voted boolean value
    }
    
    // Array of all polls created on the contract
    Poll[] private polls;
    // Mapping from address to a Voter's data
    mapping(address => VoterData) private voters;
    
    event PollCreated(uint256 _pollId);     // Event emitted on creation of new poll

    // Function to create a new poll, Question string and Options string array are required
    function createPoll(string memory _question, string[] memory _options) public {
        require(bytes(_question).length > 0, "Question required");
        require(_options.length > 1, "Minimum two options required");
        
        uint256 newId = polls.length;                   // IDs are assigned sequentially
        Poll memory newPoll = Poll({                    // New Poll Object
            id : newId,
            question: _question,
            options: _options,
            results: new uint64[](_options.length)
        });
        polls.push(newPoll);                            // New Poll added to Poll array
        emit PollCreated(newId);                        // Emitting the event
    }
    
    // Function to get details of a poll with given Poll ID
    function getPoll(uint256 pollId) external view returns(uint256, string memory, uint64[] memory, string[] memory){
        require(pollId < polls.length, "Poll does not exist");
        return (
            polls[pollId].id,
            polls[pollId].question,
            polls[pollId].results,
            polls[pollId].options
        );
    }
    
    // Function to cast vote in a Poll. Poll ID and Option ID are required.
    function acceptVote(uint256 _pollId, uint16 _vote) external{
        require(_pollId < polls.length, "Poll does not exist");
        require(voters[msg.sender].votedMap[_pollId] == false, "User's vote has already been accepted");
        require(_vote < polls[_pollId].options.length, "Invalid option");
        
        polls[_pollId].results[_vote] += 1;             // Vote count in Result array for provided option is incremented by 1
        voters[msg.sender].votedIds.push(_pollId);      // Poll ID is added to Voter's voted array
        voters[msg.sender].votedMap[_pollId] == true;   // Mapping of Voted IDs updated
        
    }

    // Function to get the Poll IDs that a given address has voted in.
    function getVoter(address _id) external view returns(uint256[] memory){
        return voters[_id].votedIds;
    }

    // Function to get the total number the polls on the contract
    function getTotalPolls() external view returns(uint256){
        return polls.length;
    }
}