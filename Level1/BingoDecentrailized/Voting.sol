// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.5.0 < 0.9.0;

struct Round{
    uint _round_no;
    uint _votes;
}

    
contract voting{
    Round public round;
    //uint voters =0;
    //Voter[] public voters;
    mapping(uint=>address) voters;
    mapping(address=>bool) voted;
    uint public len;
    uint public sum;
    uint public candidate_winner;
    uint public winner;

    uint[25] public freq;

    constructor(){
        round._round_no=0;
        round._votes=0;
    }

    // Add Player
    function addVoter() public{
        voters[len]=msg.sender;
        voted[msg.sender]=false;
        len++;
    }

    //Winner of Each round can be seen 
    function findWinner() private{
        uint max;
        
        for(uint i; i<25; ++i){
            if(freq[i]>max){
                max=freq[i];
                winner=i+1;
            } 
        }

        if(max<len/2+1) winner=candidate_winner;
    }

    //Restart a round
    function reset() private{
        for(uint i; i<len; ++i){
            voted[voters[i]]=false;
        }

        for(uint i; i<25; ++i) freq[i]=0;
    }

    //Vote for cross out (with error handling)
    function vote(uint v) public{
        require(!voted[msg.sender],"You can only vote once!");

        // round % participants is turn of the participant
        if(voters[round._round_no % len]==msg.sender){
            candidate_winner = v;
        }

        voted[msg.sender]=true;
        freq[v-1]++;
        sum+=v;
        round._votes++;
        if(round._votes == len){
            round._round_no++;
            round._votes=0;
            findWinner();
            reset();
        }
    } 

}
