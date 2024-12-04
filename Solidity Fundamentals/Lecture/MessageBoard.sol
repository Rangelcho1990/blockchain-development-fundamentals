// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract MessageBoar {
    mapping (address => string[]) public messages;

    function keepMessage(string calldata message) external  {
        messages[msg.sender].push(message); // persistent memory
    }

    function previewMessage(string calldata message) external pure returns (string memory) {
        return string(abi.encodePacked('Draft:', message)); //encodePacked returns bytes
    }
}
