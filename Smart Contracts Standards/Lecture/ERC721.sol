// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract ERC721 {
    mapping(uint256 tokenId => address) private _owners;
}

contract ERC721Receiver {
    address owner;

    constructor() {
        owner = msg.sender;
    }

    function onERC721Received(address operator, address _from, uint256 _tokenId, bytes memory _data) external pure returns (bytes4) {
        return bytes4(keccak256("dsadasdsadsad"));
    }
}
