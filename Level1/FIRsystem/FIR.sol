// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract FIR {
    address public owner;
    struct Report {
        string description;
        address reporter;
        bool resolved;
    }
    mapping(uint => Report) public reports;
    uint public reportCount;

    constructor() {
        owner = msg.sender;
    }

    function reportIncident(string memory _description) public {
        reports[reportCount] = Report(_description, msg.sender, false);
        reportCount++;
    }
    function resolveIncident(uint _reportId) public {
        require(msg.sender == owner, "Only the owner can resolve incidents.");
        reports[_reportId].resolved = true;
    }
    function getReport(uint _reportId) public view returns (string memory, address, bool) {
        return (reports[_reportId].description, reports[_reportId].reporter, reports[_reportId].resolved);
    }
}
