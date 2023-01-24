// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.9.0;

contract Wallet{

    //creating the events which would hold the state of the transactions at each level
    event Deposit(address indexed sender,uint256 amount, uint256 balance);
    event Submit(address indexed owner, uint256 indexed transactionId, address indexed transactionTo, uint256 value, bytes data);

    event Confirmation(address indexed owner, uint256 indexed transactionId );
    event Revoke(address indexed owner, uint256 indexed transactionId );
    event Execute(address indexed owner, uint256 indexed transactionId );

    //the list of owners who make the decisions
    address[] owners;
    mapping(address=>bool) public isOwner;

    uint256 public confirmedNo;//minimum number of upvotes needed

    struct Transaction{
        address to; uint256 value; bytes data; bool executed; uint256 numConfirm;
    }
    
    //checking whether the transactions are confirmed or not
    mapping(uint256 => mapping(address=>bool)) public isConfirmed;
    Transaction[] private transactions;

    //modifiers are called to validate the right owner and checking the transaction is valid or not
    modifier onlyOwner(){
        require(isOwner[msg.sender],"Not the owner");
        _;
    }
    modifier transactionExist(uint256 _transactionId){
        require(_transactionId < transactions.length,"Transaction not exists");
        _;
    }
    modifier notExecuted(uint256 _transactionId){
        require(!transactions[_transactionId].executed,"Transaction is already executed");
        _;
    }
    modifier notConfirmed(uint256 _transactionId){
        require(!isConfirmed[_transactionId][msg.sender],"Transaction already Confirmed");
        _;
    }

    //accept the list of distinct owners and assign to the mapping and the list
    constructor(address[] memory _owners, uint256 _confirmationNo){

        require(_owners.length > 0,"Owners Required");
        require(_confirmationNo>0 && _confirmationNo<=_owners.length,"Error ");

        for(uint i=0;i<_owners.length;i++){

            address owner=_owners[i];
            require(owner!=address(0));
            require(!isOwner[owner],"Owner not unique");
            owners.push(owner);
            isOwner[owner]=true;

        }
        confirmedNo=_confirmationNo;
    }
    //an inbuilt function in solidity that receives the payments
    receive()external payable{
        emit Deposit(msg.sender,msg.value,address(this).balance);
    }
    //after paying the amount the user needs to send the transaction details and then the voting will occur
    function submitTransaction(address _to, uint256 _value, bytes memory _data)public onlyOwner{

        uint256 transactionId=transactions.length;
        transactions.push(Transaction(_to,_value,_data,false,0));
        emit Submit(msg.sender, transactionId, _to, _value, _data);

    }
    //confirming the transaction after the votes are done
    function confirmTransaction(uint _txIdx)public onlyOwner transactionExist(_txIdx) notExecuted(_txIdx) notConfirmed(_txIdx){
        Transaction storage transaction = transactions[_txIdx];
        transaction.numConfirm+=1;
        isConfirmed[_txIdx][msg.sender]=true;

        emit Confirmation(msg.sender,_txIdx);
    }
    
    function executeTransaction(uint _txIdx)public onlyOwner transactionExist(_txIdx) notExecuted(_txIdx) {

        Transaction storage transaction = transactions[_txIdx];
        require(transaction.numConfirm >= confirmedNo,"Cannot execute this transaction");
        transaction.numConfirm+=1;
        transaction.executed=true;

        (bool success, )=transaction.to.call{value:transaction.value}(transaction.data);

        require(success,"Transaction failed");
        emit Execute(msg.sender,_txIdx);
        
    }
    //returns the list of owners
    function getOwners()public view returns(address[] memory){
        return owners;
    }
    //returns the number of transactions executed till now
    function getTransactionCount() public view returns(uint256){
        return transactions.length;
    }
    
    
}