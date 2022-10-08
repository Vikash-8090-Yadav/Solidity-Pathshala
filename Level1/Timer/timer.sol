// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract timer
{
    //start time
    uint _start;
    //End time
    uint _end;
    //modifier timeover
    modifier timeover{
        require(block.timestamp<=_end,"The Time is Over");
        _;
    }
    //start function
    function start () public{
        _start=block.timestamp;
    }
    //end function
    function end(uint TotalTime) public{
        _end=TotalTime+block.timestamp;
    }
    //TimeLeft function
    function TimeLeft()public timeover view returns(uint){
        return _end-block.timestamp;
    }
}
