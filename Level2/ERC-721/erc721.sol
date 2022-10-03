// SPDX-License-Identifier: GPL3

pragma solidity ^0.8.7;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MyNFT is ERC721 {
    uint256 private s_tokenIdCounter;

    // Event to be emitted when nft minted
    event CreatedNFT(uint256 indexed tokenId);

    // ERC721 is like the super class which we inherit to use all its properties and methods
    constructor() ERC721("MyNFT", "Square") {
        s_tokenIdCounter = 0;
    }

    function mintNft() public {
        // Mint a new token with s_tokenIdCounter as id
        _safeMint(msg.sender, s_tokenIdCounter);

        // Increment the counter
        s_tokenIdCounter = s_tokenIdCounter + 1;

        // Emitting the event of event creation with tokenId
        emit CreatedNFT(s_tokenIdCounter);
    }

    function _baseURI() internal pure override returns (string memory) {
        // Common URI for all token Ids
        return
            "data:application/json;base64,ewogICJuYW1lIjogIk5GVCBmb3IgU1NPQyIsCiAgImRlc2NyaXB0aW9uIjogIkEgc2ltcGxlIHRleHQgYmFzZWQgbmZ0IG1hZGUgZm9yIFNTT0MgYW5kIHVkZXIgdGhlIHByb2plY3Qgd2ViMy1odWIiLAogICJhdHRyaWJ1dGVzIjogW3sgInRyYWl0X3R5cGUiOiAic2ltcGxlIiwgInZhbHVlIjogMSB9XSwKICAiaW1hZ2UiOiAiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxQSE4yWnlCMmFXVjNRbTk0UFNJd0lEQWdNakF3SURJd01DSWdkMmxrZEdnOUlqUXdNQ0lnSUdobGFXZG9kRDBpTkRBd0lpQjRiV3h1Y3owaWFIUjBjRG92TDNkM2R5NTNNeTV2Y21jdk1qQXdNQzl6ZG1jaVBnb2dJRHhqYVhKamJHVWdZM2c5SWpFd01DSWdZM2s5SWpFd01DSWdabWxzYkQwaWVXVnNiRzkzSWlCeVBTSTNPQ0lnYzNSeWIydGxQU0ppYkdGamF5SWdjM1J5YjJ0bExYZHBaSFJvUFNJeklpOCtDaUFnUEdjZ1kyeGhjM005SW1WNVpYTWlQZ29nSUNBZ1BHTnBjbU5zWlNCamVEMGlOakVpSUdONVBTSTRNaUlnY2owaU1USWlMejRLSUNBZ0lEeGphWEpqYkdVZ1kzZzlJakV5TnlJZ1kzazlJamd5SWlCeVBTSXhNaUl2UGdvZ0lEd3ZaejRLSUNBOGNHRjBhQ0JrUFNKdE1UTTJMamd4SURFeE5pNDFNMk11TmprZ01qWXVNVGN0TmpRdU1URWdOREl0T0RFdU5USXRMamN6SWlCemRIbHNaVDBpWm1sc2JEcHViMjVsT3lCemRISnZhMlU2SUdKc1lXTnJPeUJ6ZEhKdmEyVXRkMmxrZEdnNklETTdJaTgrQ2p3dmMzWm5QZz09Igp9";
    }

    // URI of token includes text svg as image
    function tokenURI(
        uint256 /* tokenId */
    ) public pure override returns (string memory) {
        string memory TOKEN_URI = _baseURI();
        return TOKEN_URI;
    }

    // total number of tokens minted
    function getTokenCounter() public view returns (uint256) {
        return s_tokenIdCounter;
    }
}
