pragma solidity ^0.8.4;

contract Coin {
    // The keyword "public" makes variables
    // accessible from other contracts
    address public minter;
    mapping (address => uint) public balances;

    // Events allow clients to react to specific
    // contract changes you declare
     /* Event is an inheritable member of a contract. An event is emitted, it stores the arguments passed in transaction logs. 
     These logs are stored on blockchain and are accessible using address of the contract till the contract is present on the blockchain. */ 
    event Sent(address from, address to, uint amount);

    // Constructor code is only run when the contract
    // is created
    constructor() {
        minter = msg.sender;
    }

    // Sends an amount of newly created coins to an address
    function mint(address receiver, uint amount) public {
        balances[receiver] += amount;
        //anybody can mint no restrictions with the require statement removed **
    }

    // Errors allow you to provide information about
    // why an operation failed. They are returned
    // to the caller of the function.
    error InsufficientBalance(uint requested, uint available);
    
    error Restricted(uint amount , string msg);
    // Sends an amount of existing coins
    // from any caller to an address
    function send(address receiver, uint amount) public {
        if (amount > 50000)
            revert Restricted(amount , 'Amount too large to be sent at once');
        //this if statement restricts the amount to be sent to the other person in one go and reverts back the transaction. **
        if (amount > balances[msg.sender])
            revert InsufficientBalance({
                requested: amount,
                available: balances[msg.sender]
            });
        
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        emit Sent(msg.sender, receiver, amount);
    }
}
