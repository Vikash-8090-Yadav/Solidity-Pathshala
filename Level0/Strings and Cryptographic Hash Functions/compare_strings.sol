// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;
contract Strings {

	string s1 = "Hello World!";

	function isEqual (string memory _string) public returns(bool) {
	  if (keccak256(abi.encodePacked(s1)) == keccak256(abi.encodePacked(_string))) {
	  return true;
	  }
	}
}