// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

struct Vote{
    address shareholder;
    uint256 shares;
    uint256 timestamp;
}

error InsuficiantAmount();

contract Crowdfunding {
    mapping(address => uint256) public shares;
    Vote[] public votes;
    uint256 public sharePrice;
    uint256 public totalShares;

    constructor(uint256 _initSharePrice){
        sharePrice = _initSharePrice; 
    }

    function buyShares() external payable {
        if (msg.value < sharePrice) {
            revert InsuficiantAmount(); 
        }

        if (msg.value % sharePrice > 0) {
            revert InsuficiantAmount(); 
        }

        uint256 sharesToReceive = msg.value / sharePrice; // value of 2 eth and share price 1 eht, takes 2 shares

        totalShares = sharesToReceive;
        shares[msg.sender] += sharesToReceive;
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
}
