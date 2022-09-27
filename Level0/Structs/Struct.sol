// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;
contract SandwichFactory { // declaring the contract 
  struct Sandwich {  // struct is used to define particular data types and 
    string name;
    string status;
  }

  Sandwich[] sandwiches; //defining a struct of type Sandwich
  
  function eatSandwich(uint _index) public { // declaring a public function


    Sandwich storage mySandwich = sandwiches[_index]; //storage variables are stored permanently on blockchain
    // here `mySandwich` is a pointer to `sandwiches[_index]`

    mySandwich.status = "Eaten!";
    // this will permanently change `sandwiches[_index]` on the blockchain.

    Sandwich memory anotherSandwich = sandwiches[_index + 1]; //we use memory to create a copy of data
    
    // here `anotherSandwich` will simply be a copy of the 

    anotherSandwich.status = "Eaten!";
    // this will modify the temporary variable and have no effect on `sandwiches[_index + 1]

    sandwiches[_index + 1] = anotherSandwich; // But here the changes will be saved over the blockchain
  }
}
