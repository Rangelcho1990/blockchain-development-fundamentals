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

    uint256 public sharePrice = 1 ether;

    uint256 public hours5 = 5 hours;
    uint256 public min = 5 minutes;
    uint256 public sec = 5 seconds;

    // constructor(uint256 _initSharePrice){
    //     sharePrice = _initSharePrice;
    // }

    function addShares() external payable {
        // shares[receiver] += 100;
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
}
