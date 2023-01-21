// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Freelancer {
    /**
    Enum shows current project state
    initiated => when this contract is called by freelancer
    accepted => when the freelancer accepts the proposal
    closed => project is completed and called by the freelancer
    */

    enum ProjectState {
        initiated,
        accepted,
        closed
    }

    /**
    enum Schedule state this allow freelancer to have multiple milestone in project.
    A freelance can get paid after completing each milestone.
     */
    enum ScheduleState {
        proposal,
        financed,
        started,
        approved,
        released
    }

    /**
    struct schedule track the project state for each milestone
    e.g. UI development 
    (shortCode = UI_DEV, description = Designing UI, value(price for completing this stage)=1000wei, currentState = proposal)
    So this contract have multiple level like UI dev, coding, Devops and then CI/CD each stage have different schedule state 
    and a freelancer can get paid for completed each of the stage.
     */

    struct schedule {
        string shortCode;
        string description;
        uint256 value;
        ScheduleState scheduleState;
    }


    // Track the record for the number of schedule means number of the stages.
    int256 public numberOfSchedules = 0;

    // stores freelancers address
    address payable public freelancerAddress;

    // client Address who want to hire a freelancer
    address public clientAddress;

    // current Project state
    ProjectState public projectState;

    // register for tracking the record for the total number of stage (e.g. UI development, Coding, DevOps etc)
    mapping(int256 => schedule) public scheduleRegister;

    // these are the some modifier which is pretty much self explanatory
    modifier onlyFreelancer() {
        require(msg.sender == freelancerAddress);
        _;
    }

    modifier onlyClient() {
        require(msg.sender == clientAddress);
        _;
    }

    modifier requiredProjectState(ProjectState _state) {
        require(projectState == _state);
        _;
    }

    modifier requiredScheduleState(ScheduleState _state, int256 _scheduleID) {
        require(
            (_scheduleID <= numberOfSchedules - 1) &&
                scheduleRegister[_scheduleID].scheduleState == _state
        );
        _;
    }

    modifier requireFunding(int256 _scheduleID, uint256 _funding) {
        require(scheduleRegister[_scheduleID].value == _funding);
        _;
    }

    modifier zeroBalance() {
        require(address(this).balance == 0);
        _;
    }

    event scheduleAdded(string shortCode);
    event projectAccepted(address clientAddress);
    event taskFinanced(int256 scheduleID);
    event taskStarted(int256 scheduleID);
    event taskApproved(int256 scheduleID);
    event fundReleased(int256 scheduleID, uint256 valueReleased);
    event projectEnded();

    constructor() {
        freelancerAddress = payable(msg.sender);
        projectState = ProjectState.initiated;
    }

    // create the schedule with short code its description and pricing for this contract
    // e.g. shortCode => UI-UX, description => Designing and develop UI
    function addSchedule(
        string memory _shortCode,
        string memory _description,
        uint256 _value
    ) public requiredProjectState(ProjectState.initiated) onlyFreelancer {
        // memory keyword same as memory in a real system this will not be stored in the blockchain
        schedule memory newSchedule;
        newSchedule.shortCode = _shortCode;
        newSchedule.description = _description;
        newSchedule.value = _value;
        newSchedule.scheduleState = ScheduleState.proposal;
        scheduleRegister[numberOfSchedules] = newSchedule;
        numberOfSchedules++;
        emit scheduleAdded(_shortCode);
    }

    // When the freelancer accepts the proposal of the client
    function acceptProject()
        public
        requiredProjectState(ProjectState.initiated)
    {
        clientAddress = msg.sender;
        projectState = ProjectState.accepted;
        emit projectAccepted(clientAddress);
    }

    // freelancer only start working on the project after client funded the project
    // the fund transfer to this contract is kept in this contract and then it is release (transfer to freelancer    
    // address) after the freelancer complete the stage (e.g. UI development)
    function financeTask(int256 _scheduleID)
        public
        payable
        requiredProjectState(ProjectState.accepted)
        requiredScheduleState(ScheduleState.proposal, _scheduleID)
        requireFunding(_scheduleID, msg.value)
    {
        scheduleRegister[_scheduleID].scheduleState = ScheduleState.financed;
        emit taskFinanced(_scheduleID);
    }

    // this function tells the client that freelancer started creating the project.
    function starTask(int256 _scheduleID)
        public
        requiredProjectState(ProjectState.accepted)
        requiredScheduleState(ScheduleState.financed, _scheduleID)
        onlyFreelancer
    {
        scheduleRegister[_scheduleID].scheduleState = ScheduleState.started;
        emit taskStarted(_scheduleID);
    }


    // this function approves the project and only called by the client after client is staisfied with the work
    function approveTask(int256 _scheduleID)
        public
        requiredProjectState(ProjectState.accepted)
        requiredScheduleState(ScheduleState.started, _scheduleID)
        onlyClient
    {
        scheduleRegister[_scheduleID].scheduleState = ScheduleState.approved;
        emit taskApproved(_scheduleID);
    }

    // after approval of the client freelancer can release the fund to his/her address
    function releaseFunds(int256 _scheduleID)
        public
        payable
        requiredProjectState(ProjectState.accepted)
        requiredScheduleState(ScheduleState.approved, _scheduleID)
        onlyFreelancer
    {
        freelancerAddress.transfer(scheduleRegister[_scheduleID].value);
        scheduleRegister[_scheduleID].scheduleState = ScheduleState.released;
        emit fundReleased(_scheduleID, scheduleRegister[_scheduleID].value);
    }

    // this function is called by the freelancer after the project is completed
    function endProject()
        public
        requiredProjectState(ProjectState.accepted)
        zeroBalance
        onlyFreelancer
    {
        projectState = ProjectState.closed;
        emit projectEnded();
    }

    // fetch the balance of the contract to ensure all the funds is transfers from this contract to freelancer address
    function getBalance() public view returns (uint256 balance) {
        return address(this).balance;
    }
}
