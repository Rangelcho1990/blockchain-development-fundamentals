// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract Crowdfunding {
    uint256 public goalAmount;
    uint256 public endTime;

    mapping(address => uint256) private contributions; // save each backer contribution

    constructor(uint256 _goalAmount, uint256 _endTime){
        goalAmount = _goalAmount; 
        endTime = _endTime; 
    }

    function contribute(uint256 amount) external {
        require(amount > 0, "Amount should be positive number");

        contributions[msg.sender] = amount;
    }

    function checkGoalReached(address user) external {
    }
}
