//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import {ERC721} from "lib/openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
contract BasicNFT is ERC721
{
    uint256 private s_counter;
    mapping(uint256=>string) private s_tokenIdToURI;
    constructor()ERC721("Jamie","JM")
    {
        s_counter=0;
    }
    function mintNFT(string memory tokenUri)external 
    { 
        s_tokenIdToURI[s_counter]= tokenUri;
        _safeMint(msg.sender,s_counter);
        s_counter++;
    }
    function tokenURI(uint256 tokenId) public view override returns (string memory) 
    {
        return s_tokenIdToURI[tokenId];
    }
}
