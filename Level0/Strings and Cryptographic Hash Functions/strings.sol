pragma solidity ^0.8.7;

contract SolidityStrings {
  // using double quotes
  string str1 = "Gavin";

  // using single quotes
  string str2 = 'Belson';

  // using string constructor
  string str3 = new string(2022);

  // getter function to retrieve value of str1
  function getString1() public view returns(string memory) {
    return str1;
  }

  // getter function to retrieve value of str2
  function getString2() public view returns(string memory) {
    return str2;
  }

  // getter function to retrieve value of str3
  function getString3() public view returns(string memory) {
    return str3;
  }
}