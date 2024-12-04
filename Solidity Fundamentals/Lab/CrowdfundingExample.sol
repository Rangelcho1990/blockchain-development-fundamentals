// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

struct Vote{
    address shareholder;
    uint256 shares;
    uint256 timestamp;
}

contract Crowdfunding {
    mapping(address => uint256) public shares;
    Vote[] public votes;
    uint256 public sharePrice;
    uint256 public totalShares;

    constructor(uint256 _initSharePrice){
        sharePrice = _initSharePrice; // set initial share price
    }

    function addShares() external payable {
        totalShares = msg.value;

        // shares[msg.sender] += 1000; // we know who calls the method, cannot be manipuleted
        shares[msg.sender] += msg.value; // works with payble
    }

    function vote(address holder) external {
        votes.push(
            Vote({
                shareholder: holder,
                shares: shares[holder],
                timestamp: block.timestamp
            })
        );
    }

    // function getUserShares(address user) external view returns (uint) {
    //     return shares[user];
    // }
}
