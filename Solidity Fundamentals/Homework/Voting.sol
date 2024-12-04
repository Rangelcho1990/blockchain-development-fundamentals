// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

struct Voter{
    bool hasVoted; // true|false updated when user vote
    uint256 choice; // candidate ID  updated when user vote
}

contract Voting {
    mapping(address => Voter) private voters;

    function registerVote(uint256 cadidateId) external {
        require(cadidateId > 0, "Candidate id should be positive number");

        voters[msg.sender] = Voter({
            hasVoted: true,
            choice: cadidateId
        });
    }

    function getVoterStatus() external view returns (Voter memory) {
        return voters[msg.sender];
    }
}
