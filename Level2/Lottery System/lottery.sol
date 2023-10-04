// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
// added VRF(verifiable random function contract and interface to generate truly random number) 
import "@chainlink/contracts/src/v0.8/interfaces/VRFCoordinatorV2Interface.sol";
import "@chainlink/contracts/src/v0.8/VRFConsumerBaseV2.sol";

error Raffle__SendMoreToEnterRaffle();

contract Lottery is is VRFConsumerBaseV2{
    // address public manager;
    // address payable[] public participants;
    
  

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
  RaffleState private s_raffleState;

    // Events 
  event RequestedRaffleWinner(uint256 indexed requestId);
  event RaffleEnter(address indexed player);
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
    s_raffleState = RaffleState.OPEN;
    s_lastTimeStamp = block.timestamp;
    i_callbackGasLimit = callbackGasLimit;
    manager=msg.sender;
  }


        modifier onlyManager() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }
}
