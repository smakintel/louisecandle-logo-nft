// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract LouiseCandleLogoNFT is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("LouiseCandleLogoNFT", "LCL") {}

    // address recipient specifies the address that will receive your freshly minted NFT
    // string memory tokenURI is the pointer to JSON file whcih will have metada of actual NFT
    // such as An NFT's metadata is really what brings it to life, allowing it to have additional properties,
    // such as a name, description, image, and other attributes.
    function mintNFT(address recipient, string memory tokenURI)
        public
        onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}