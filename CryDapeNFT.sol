// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "erc721a/contracts/ERC721A.sol";

contract CryDape is ERC721A {

    uint256 TOTAL_SUPPLY = 500;
    uint256 MAX_MINTS = 69;

    string public baseURI = "ipfs://bafybeidt5boy4ousc3jl7v6v5xvle6ybiteqduek7moil6gtzajazfxq2y/";

    constructor() ERC721A ("CryDape","CDP") {}

    function mint(uint256 quantity)
    external 
    {
        require(quantity + _numberMinted(msg.sender) <= MAX_MINTS, "Exceeded the Limit");
        require(totalSupply() + quantity <= TOTAL_SUPPLY, "Not Enough tokens Left");
        _safeMint(msg.sender, quantity);
    }

    function _baseURI()
    internal 
    view 
    override 
    returns (string memory)
    {
        return baseURI;
    }

}