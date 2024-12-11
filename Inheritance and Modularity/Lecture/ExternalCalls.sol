// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract InfoFeed {
    bool public passed = false;

    function info() public payable returns (uint256 result) {
        result = 42;
    }

    receive() external payable {
        // receive transaction to the contract only with value without function that can be called.
    }

    fallback() external payable  {
        // call any function
        passed = true;
    }
}

// above separete contract
interface IMyInfoFeed {
    function info() external payable returns (uint256 result);
}

contract Consumer {
    IMyInfoFeed feed;

    function setFeed(IMyInfoFeed addr) public {
        feed = addr; // give InfoFeed(istance of the contract) value to feed
    }

    function callFeed() public payable returns (uint256 feedResult) {
        feedResult = feed.info();
        // feedResult = feed.info{value:10, gas:80}();
    }

    function sendViaSend(address payable _to) public payable {
        bool ok = payable(_to).send(msg.value);

        require(ok, "Failed to send Ether");
    }

    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }
}
