// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

enum VotingOptions {
    CandidateOne,
    CandidateTwo
}

error InvalidCandidate();

contract SimpleVoting {
    bool public votingEnded = false;
    address public candidate1 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    address public candidate2 = 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2;
    uint256 public votesCandidateOne;
    uint256 public votesCandidateTwo;
    address public owner = 0xdD870fA1b7C4700F2BD7f44238821C26f7392148;
    address public winner;

    function vote(address candidate) external  {
        require(!votingEnded, 'Voting has alredy ended');

        if (candidate == candidate1) {
            votesCandidateOne += 1;
        } else if(candidate == candidate2) {
            votesCandidateTwo++;
        } else {
            revert InvalidCandidate();
        }
    }

    function chooseWinner() external {
        require(msg.sender == owner, 'Not owner');

        votingEnded = true;

        if (votesCandidateOne > votesCandidateTwo) {
            winner = candidate1;
        }else if (votesCandidateOne < votesCandidateTwo) {
            winner = candidate2;
        } else {
            revert('More voting needed');
        }
    }
}
