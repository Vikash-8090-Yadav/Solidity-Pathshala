# NFT-ERC721

## Description

It is a simple ERC721 token.
It have a common TokenURI for all minted tokens.
It uses text based svg as token image.
Name of token is MyNFT and it's symbol is Square.

## How this is build

I have build this smart contract using the [Foundry](https://github.com/foundry-rs/foundry) and the library openzeppelin contracts.

## Tech Stack Used

I have used following tech stacks:-

- Solidity
- Foundry
- Remix
- OpenZeppelin

## Steps to Run

To run it, we just have to copy the smart contract into [Remix ide](https://remix.ethereum.org/), remix automatically compiles the contract. Then we to just deploy, smart contract's constructor doesn't take any arguments. After deployment we can mint nft using mintNft function. That's all.

## Funtions in the smart contract:-

- **Approves** :- it approves another address to transfer the given token ID The zero address indicates there is no approved address. There can only be one approved address per token at a given time. Can only be called by the token owner or an approved operator.
 
- **MintNFT**:- allows user to mint nft take the address of the user and takes the token id i.e the token address which tells us which token is being minted. Reverts if the given token ID already exists.

- **safeTransferFrom** :- Transfers a specific NFT (tokenId) from one account  to another.

- **setApprove** :- Sets or unsets the approval of a given operator An operator is allowed to transfer a tokens of the sender on their behalf.

- **transferFrom** :-Transfers the ownership of a given token ID to another address

- **balanceOf** :- Gets the balance of the specified address.

- **getApproved** :- Gets the approved address for a token ID, or zero if no address set Reverts if the token ID does not exist.

- **isApproved** :- Tells whether an operator is approved by a given owner

- **name** :- tells the name of the Contract ( In our case it's MyNft)

- **ownerOf** :- The purpose of this function is to return the address of the owner of a token. ERC721 token is referenced on the blockchain network via a unique ID. Using this ID we can determine the owner of a token

- **supportsInterface** :- Returns true if this contract implements the interface defined by interfaceId.

- **symbol** :- Tells the symbol of our token ( The symbol of the token which we passed in our constructor)

- **tokenURI** :-Returns the URI for a given token ID.

## Output Screenshots:-

![Screenshot 2022-10-02 191644](https://user-images.githubusercontent.com/95535448/193457399-1ddd16cd-573f-47cf-a1b9-b9cfc1573f06.png)

https://user-images.githubusercontent.com/95535448/188207166-562f206d-f272-4209-941e-ff1b8f730aae.mp4


