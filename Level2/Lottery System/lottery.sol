// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
// added VRF(verifiable random function contract and interface to generate truly random number) 
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

error Lottery__SendMoreToEnterLottery();
error   Lottery__LotteryNotOpen();

contract Lottery is is VRFConsumerBaseV2{
    // address public manager;
    // address payable[] public participants;

    enum LotteryState {
    OPEN,
    CALCULATING
  }
    
  

 //Making Chainlink VRF Variables immutable to reduce gas consumption
     VRFCoordinatorV2Interface private immutable i_vrfCoordinator;
  uint64 private immutable i_subscriptionId;
  bytes32 private immutable i_gasLane;
  uint32 private immutable i_callbackGasLimit;
  uint16 private constant REQUEST_CONFIRMATIONS = 3;
  uint32 private constant NUM_WORDS = 1;

//making variable private as well as immuatable
  uint256 private immutable i_interval;
  uint256 private immutable i_entranceFee;
  uint256 private s_lastTimeStamp;
  address private s_recentWinner;
  address payable[] private s_players;
  LotteryState private s_LotteryState;

    // Events 
  event RequestedLotteryWinner(uint256 indexed requestId);
  event LotteryEnter(address indexed player);
  event WinnerPicked(address indexed player);

  constructor(
    address vrfCoordinatorV2,
    uint64 subscriptionId,
    bytes32 gasLane, // keyHash
    uint256 interval,
    uint256 entranceFee,
    uint32 callbackGasLimit
  ) 
  VRFConsumerBaseV2(vrfCoordinatorV2) {
    i_vrfCoordinator = VRFCoordinatorV2Interface(vrfCoordinatorV2);
    i_gasLane = gasLane;
    i_interval = interval;
    i_subscriptionId = subscriptionId;
    i_entranceFee = entranceFee;
    s_LotteryState = LotteryState.OPEN;
    s_lastTimeStamp = block.timestamp;
    i_callbackGasLimit = callbackGasLimit;
    manager=msg.sender;
  }
  // Defining functions
        modifier onlyManager() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    //Enter  Lottery function with revert rathar than require which uses relativelt more gas

    function enterLottery() public payable {
    // require(msg.value >= i_entranceFee, "Not enough value sent");
    // require(s_LotteryState == LotteryState.OPEN, "Lottery is not open");
    if (msg.value < i_entranceFee) {
      revert Lottery__SendMoreToEnterLottery();
    }
    if (s_LotteryState != LotteryState.OPEN) {
      revert Lottery__LotteryNotOpen();
    }
    s_players.push(payable(msg.sender));
    emit LotteryEnter(msg.sender);
  }

// In this function we check that we need to conduct lottery game or not
  function checkUpkeep(
    bytes memory /* checkData */
  )
    public
    view
    override
    returns (bool upkeepNeeded, bytes memory /* performData */)
  {
    bool isOpen = LotteryState.OPEN == s_LotteryState;
    bool timePassed = ((block.timestamp - s_lastTimeStamp) > i_interval);
    bool hasPlayers = s_players.length > 0;
    bool hasBalance = address(this).balance > 0;
    upkeepNeeded = (timePassed && isOpen && hasBalance && hasPlayers);
    return (upkeepNeeded, "0x0"); // can we comment this out?
  }

  
  function performUpkeep(bytes calldata /* performData */) external override {
    (bool upkeepNeeded, ) = checkUpkeep("");
    if (!upkeepNeeded) {
      revert Lottery__UpkeepNotNeeded(
        address(this).balance,
        s_players.length,
        uint256(s_LotteryState)
      );
    }
    s_LotteryState = LotteryState.CALCULATING;
    uint256 requestId = i_vrfCoordinator.requestRandomWords(
      i_gasLane,
      i_subscriptionId,
      REQUEST_CONFIRMATIONS,
      i_callbackGasLimit,
      NUM_WORDS
    );
    emit RequestedLotteryWinner(requestId);
  }


  function fulfillRandomWords(
    uint256 /* requestId */,
    uint256[] memory randomWords
  ) internal override {

    uint256 indexOfWinner = randomWords[0] % s_players.length;
    address payable recentWinner = s_players[indexOfWinner];
    s_recentWinner = recentWinner;
    s_players = new address payable[](0);
    s_LotteryState = LotteryState.OPEN;
    s_lastTimeStamp = block.timestamp;
    (bool success, ) = recentWinner.call{ value: address(this).balance }("");
    if (!success) {
      revert Lottery__TransferFailed();
    }
    emit WinnerPicked(recentWinner);
  }
  //adding getter functions
    function getRaffleState() public view returns (RaffleState) {
    return s_raffleState;
  }

  function getNumWords() public pure returns (uint256) {
    return NUM_WORDS;
  }

  function getRequestConfirmations() public pure returns (uint256) {
    return REQUEST_CONFIRMATIONS;
  }

  function getRecentWinner() public view returns (address) {
    return s_recentWinner;
  }

  function getPlayer(uint256 index) public view returns (address) {
    return s_players[index];
  }

  function getLastTimeStamp() public view returns (uint256) {
    return s_lastTimeStamp;
  }

  function getInterval() public view returns (uint256) {
    return i_interval;
  }

  function getEntranceFee() public view returns (uint256) {
    return i_entranceFee;
  }

  function getNumberOfPlayers() public view returns (uint256) {
    return s_players.length;
  }
}
