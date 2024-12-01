// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract GoalTracker {
    uint256 public goal;
    uint256 public reward;
    uint256 public totalSpending;
    uint256 public numberOfApply = 5; // can be setted
    bool public rewardClaimed = false;

    function setGoalAndReward(uint256 goalInput, uint256 rewardInput) public {
        require(goalInput > 0, "Goal amount should be positive number.");
        require(rewardInput > 0, "Reward should be positive number.");

        goal = goalInput;
        reward = rewardInput;
    }    

    function addSpending(uint256 spending) public {
        require(spending > 0, "Spending should be positive number.");
        totalSpending += spending;
    }

    function claimReward() public returns (uint256){
        if (rewardClaimed) {
            revert ("The reward has already been claimed.");
        }

        if (totalSpending < goal) {
            revert ("The goal has not been reached yet.");
        }

        uint256 totalReward = 0;
        for (uint256 i = 0; i < numberOfApply; i++) {
            totalReward += reward;
        }

        rewardClaimed = true;

        return totalReward;
    }
}
