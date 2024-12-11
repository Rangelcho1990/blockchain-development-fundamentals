// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

contract ChildContract {
    address public owner;

    constructor(address _owner) {
        owner = _owner;
    }
}

contract Factory {
    ChildContract[] public children;

    function createChild() public {
        ChildContract child = new ChildContract(msg.sender);
        children.push(child);
    }
}
