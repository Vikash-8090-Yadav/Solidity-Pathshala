// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol"; //imported the files from openzeppelin for erc20
import "@openzeppelin/contracts/token/ERC20/IERC20.sol"; // interface of erc20

contract Solidity_Pathshala is ERC20 {
    IERC20 private _token;

    // constructor to create the token and give names to the token
    // ERC20("Name of your token" ,"symbol of your token")

    constructor(uint256 initialSupply) ERC20("Solidity-Pathshala", "SOP") {
        _mint(msg.sender, initialSupply);

        //mint the required amount of tokens
    }

    //last two function implements erc20 interface which helps to interact with contract externally

    //setting the address to the current token
    function setAddress(IERC20 token) external {
        _token = token;
    }

    //transfering fund to other accounts
    function tranferingfunds(address payable to, uint256 amt) external {
        _token.transfer(to, amt);
    }
}
