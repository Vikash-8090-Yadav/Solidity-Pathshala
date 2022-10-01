// SPDX-License-Identifier: MIT
pragma solidity ^0.6.11;

contract StudentAttendance {
    address public teacher;

    struct Student {
        string name;
        uint256 attendance;
        bool isReg;
    }

    mapping(address => Student) students;

    constructor() public {
        teacher = msg.sender;
    }

    modifier isTeacher() {
        require(msg.sender == teacher, "You are not authorized!");
        _;
    }

    function addStudent(string memory _name) public {
        students[msg.sender].name = _name;
    }

    function validateRegistration(address _address) public isTeacher {
        students[_address].isReg = true;
    }

    function createAttendance(address _address) public isTeacher {
        students[_address].attendance = students[_address].attendance + 1;
    }

    function getAttendance(address _address) public view returns (uint256) {
        return students[_address].attendance;
    }

    function showStudent(address _address)
        public
        view
        returns (
            string memory,
            uint256,
            bool
        )
    {
        return (
            students[_address].name,
            students[_address].attendance,
            students[_address].isReg
        );
    }
}