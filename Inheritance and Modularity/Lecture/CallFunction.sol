// SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

error CallFailed();

contract InfoFeed {
    function info() public payable returns (uint256 result) {
        result = 42;
    }
}

contract Consumer {
    address feedAddr;

    function setFeed(address _feedAddr) external {
        feedAddr = _feedAddr;
    }

    function callFeed() public payable returns (uint256 feedResult) {
        bytes memory funcSelector = abi.encodeWithSignature("info()");

        // (bool ok, ) = feedAddr.call{value: msg.value}(""); // same as value and send method - check ExternalCalls.sol
        // if (!ok) revert CallFailed();

        (bool ok, bytes memory data) = feedAddr.call(funcSelector);
        if (!ok) revert CallFailed();
        feedResult = abi.decode(data, (uint256));
    }
}
