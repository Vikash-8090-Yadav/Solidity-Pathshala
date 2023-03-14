pragma solidity ^0.8.3;

contract SharedWalletAllowance {
    
//  Modifier

    modifier onlyOwner {
        require(msg.sender == owner, "You are not the owner");
        _;
    }
    
//  Properties
    
    uint public allowanceAmountTotal;
    address owner;
    mapping(address => uint) public balanceReceived;
    mapping(address => uint) public accountAllowance;
     function addAllowance(address _to, uint _amount) public onlyOwner {
        
        
        assert(_amount <= getBalance());
        
        
        assert(_amount <= allowanceAmountTotal);
        
        accountAllowance[_to] += _amount;
        allowanceAmountTotal -= _amount;
    }
    

    
    /// Withdraw all of the funds to an address
    function withdrawMoney() public onlyOwner {
        address payable to = payable(msg.sender);
        to.transfer(getBalance());
    }
    
    function withdrawAllowance(uint _amount) public {
        accountAllowance[msg.sender] -= _amount;
        
        address payable to = payable(msg.sender);
        to.transfer(_amount);
    }
    
// Deposit Functions
    
    function receiveMoney() public payable {
        assert(balanceReceived[msg.sender] + msg.value >= balanceReceived[msg.sender]);
        balanceReceived[msg.sender] += msg.value;
        allowanceAmountTotal += msg.value;
    }
    
    receive() external payable {
        receiveMoney();
    }
    
// Balance Functions 
    
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

}    