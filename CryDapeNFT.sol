// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import "erc721a/contracts/ERC721A.sol";

contract CryDape is ERC721A {

    uint256 TOTAL_SUPPLY = 500;
    uint256 MAX_MINTS = 69;
    // uint256 public mintRate = 0.01 ether;
    // address public owner;

    string public baseURI = "ipfs://bafybeidt5boy4ousc3jl7v6v5xvle6ybiteqduek7moil6gtzajazfxq2y/";

    // modifier OnlyOwner(){
    //     require(msg.sender == owner,"Only owner can call this function");
    //     _;
    // }

    constructor() ERC721A ("CryDape","CDP") {}

    function mint(uint256 quantity)
    payable 
    external 
    {
        require(quantity + _numberMinted(msg.sender) <= MAX_MINTS, "Exceeded the Limit");
        require(totalSupply() + quantity <= TOTAL_SUPPLY, "Not Enough tokens Left");
        // require(msg.value >= (mintRate * quantity), "Not enough Ether Sent");
        _safeMint(msg.sender, quantity);
    }

    // function withdraw()
    // external 
    // OnlyOwner
    // {
    //     require(address(this).balance > 0, "Balance is 0");
    //     (bool success, ) = msg.sender.call{value : address(this).balance}("");
    //     require(success, "Transfer failed");
    // }
    

    function _baseURI()
    internal 
    view 
    override 
    returns (string memory)
    {
        return baseURI;
    }

}