//SPDX-License-Identifier: Unlicense

pragma solidity ^0.8.1;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract MyNFT is ERC721URIStorage {

   // OpenZeppelin help us keep track of tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    // We need to pass the name of our NFTs token and its symbol.
    constructor() ERC721("MyNFT", "Square") {}

    // A function our user will hit to get their NFT.
    function mintNFT(address recipient, string memory tokenURI) public returns (uint256) {

       // Increment token id count to create new token id
       _tokenIds.increment();
       uint256 newItemId = _tokenIds.current();

       // create the NFT
       _mint(recipient, newItemId);

       // associate tokenURI with the token
       _setTokenURI(newItemId, tokenURI);

       return newItemId;
   }