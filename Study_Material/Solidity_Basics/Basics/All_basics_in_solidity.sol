// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0; //declaring the version



contract MyContract{ //contract declaration

    //Global variables that can be accessed from anywhere inside the smart contract

    string public myString = "My string"; //state variable
    uint public myUint = 1; //state variable
    bool public myBool = true; //state variable
    int public myInt=1; //state variable
    address public myAddress = 0x52bc44d5378309EE2abF1539BF71dE1b7d7bE3b5; //state variable

    string name1 = "Name 1";
    string private name2 = "Name 2"; //accessible inside contract
    string public name3 = "Name 3"; //accessible by all means
    string internal name4 = "Name 4"; //accessible inside contract cannot be inherited

    address public contractAddress; //variables for operation defined below
    address public payer;
    address public origin;
    uint public amount;

     constructor() 
        {
            contractAddress = address(this); // address of this contract
        }

    function pay() public payable
    {
        payer = msg.sender;// who is the payer of the ether
        origin = tx.origin;// what is the origin of the transaction
        amount = msg.value;// what is the amount of the transaction
    }

    function getBlockInfo() public view returns(uint,uint,uint)
    {
        return(block.number,block.timestamp,block.chainid); // returning the information of the block
    }

    string name="Example 1"; //state variable

     //The write function will need gas when we call it
    function setName(string memory _name) public{ //function declaration
        name = _name; //function body
    }

    function getName() public view returns(string memory){ //function declaration with view modifier
        return name; //function body
    }

    function resetName() internal { //function declaration as internal that is it can be called inside the contract only
        name = "Example 1"; //function body
    }

   

    address private owner;
    string public Name="";   

    modifier onlyOwner {
        require(msg.sender == owner, 'caller must be an owner'); // a custom modifer to emphasize that the caller of the function should be owner only
        //and nobody else can call the function
        _;
        }

    function set_Name(string memory _name) onlyOwner public{ //applying the custom modifier on the function
            name=_name;
     }
    
    function add(uint a, uint b) external pure returns(uint)
    {
        return a+b; // addition operator
    }
    function sub(uint a, uint b) external pure returns(uint)
    {
        return a-b; // subtraction operator
    }
    function mul(uint a, uint b) external pure returns(uint)
    {
        return a*b; // multiplication operator
    }
    function div(uint a, uint b) external pure returns(uint)
    {
        return a/b; // divison operator
    }
    function eq(uint a, uint b) external pure returns(bool)
    {
        return a==b; // checking for equality
    }
    function neq(uint a, uint b) external pure returns(bool)
    {
        return a!=b; // checking for non equality
    }
    function lt(uint a, uint b) external pure returns(bool)
    {
        return a<b; // checking for less than 
    }
    function gt(uint a, uint b) external pure returns(bool)
    {
        return a>b; // checking for greater than
    }
    function and(bool a, bool b) external pure returns(bool)
    {
        return a&&b; // logical and operator
    }
    function or(bool a, bool b) external pure returns(bool)
    {
        return a||b; // logical or operator
    }
    function not(bool a) external pure returns(bool)
    {
        return !a; // logical not operator
    }
    function comparisonExample() external pure returns(bool)
    {
        return(1+1==2) && (2+2==4); //Comparison example
    }


    //simple even and odd determining function
    function evenOrOdd(uint x) public pure returns(string memory) 
    {
        if(x%2==0) // if else statement
        {
            return "Even";
        }
        else
        {
            return "Odd";
        }
    }

    //Declaring arrays
    uint[] public myArray = [1,2,3,4,5]; //declaring an array of uint
    uint[] public array2;// no size array
    uint[10] public array3; // specifying the size of the array
    string[] public array4 = ["apple","banana","orange"]; //declaring an array of string
    string[] public array5;// no size array of string type
    string[10] public array6; // string array with size specified

    function get(uint i) public view returns(uint)
    {
        return myArray[i]; // accessing the element of the array
    }

    function length() public view returns(uint)
    {
        return myArray.length; // accessing the length of the array
    }

    function push(uint i) public
    {
        myArray.push(i); // pushing an element to the array
    }

    function pop() public
    {
        myArray.pop(); // popping an element from the array
    }

    function remove(uint index) public
    {
        delete myArray[index]; // deleting an element from the array
    }   


    mapping(uint => string) public names; // declaring a string mapping
    mapping(uint =>address) public addresses; //declaring a address mapping
    mapping(address => uint) public balances; // declaring a uint mapping
    mapping(address => bool) public hasVoted; // declaring a bool mapping
    mapping(address => mapping(uint => bool)) public myMapping; // declaring a mapping of bool mapping

    function getmap(uint _id) public view returns(string memory)
    {
        return names[_id]; // accessing the element of the mapping
    }

    function setmap(uint _id,string memory _value) public
    {
        names[_id] = _value; // setting the element of the mapping
    }

    function removeMap(uint _id) public
    {
        delete names[_id]; // deleting the element of the mapping
    }

    struct Book{ // declaring a struct
        string title;
        string author;
        bool completed;
    }

    Book[] public books; // declaring an array of struct

    function add(string memory _title, string memory _author) public
    {
        books.push(Book(_title,_author,false)); // pushing a struct to the array
    }

    function getstruct(uint _index) public view returns (string memory title, string memory author, bool completed)
    {
        Book storage book = books[_index]; // accessing the struct from the array
        return (book.title, book.author, book.completed);
    }

    function complete(uint _index) public
    {
        Book storage book = books[_index]; // accessing the struct from the array
        book.completed = true; // changing the value of the struct
    }


    string public mesage = "Hello World";

    event MessageUpdated(address indexed _user, string _message); // declaring an event

    function updateMessage(string memory _message) public
    {
        mesage = _message; // changing the value of the state variable
        emit MessageUpdated(msg.sender, _message); // emitting the event
    }


    //Working with Ether
    uint public value1 = 1 wei;
    uint public value2 = 1;
    uint public value3 = 1 gwei;
    uint public value4 = 1000000000; // 1 ether = 1000000000 gwei
    uint public value5 = 1 ether;
    uint public value6 = 1000000000000000000; // 1 ether = 1000000000000000000 wei

    uint public count =0;

    fallback() external payable // fallback function which is called when Ether is received without any data
    {
        count++;// incrementing the count
    }

    function checkBalance() public view returns (uint)
    {
        return address(this).balance; // checking the balance of the contract
    }

    function transfer(address payable _to) public payable
    {
        (bool sent,) = _to.call{value:msg.value}(""); // sending Ether to the address
        require(sent, "Failed");// checking if the transaction is successful or not
    }


    //Error handling
    event Log(string message);

    function example1(uint _value) public
    {
        require(_value >10, "Value must be greater than 10"); // checking if the condition is true or not
        emit Log("Success");
    }

    function example2(uint _value) public
    {
        if(_value<=10)
        {
            revert("Value must be greater than 10"); // reverting the transaction
        }
        emit Log("Success");
    }

    function deposit(address _tokenAddress, uint _amount) public // depositing ERC20 tokens
    {
        IERC20(_tokenAddress).transferFrom(msg.sender, address(this), _amount); // transfering the tokens from the user to the contract
    }
}


//Inheriting a contract
contract My2ndContract is MyContract // inheriting the MyContract
{
    string public nameagain="Example 1";
}

//Interface for transfering ERC20 tokens
interface IERC20
{
    function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
}
