# Smart Contract "NFT"

#### ERC-721 tokens are non-fungible, each and every ERC-721 token has its own unique value and is to be treated individually.

![erc-721](https://user-images.githubusercontent.com/95535448/187863487-aa187c58-8ed3-4e6a-9183-5d89e52e059d.png)

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

## A video of me running the important function (Note:- 1st Account starts with 0x5B8, 2nd Account starts with 0xAb8)


https://user-images.githubusercontent.com/95535448/188207166-562f206d-f272-4209-941e-ff1b8f730aae.mp4

