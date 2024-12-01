// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract BillSpitter {
    function splitExpense(uint256 totalAmount, uint256 numPeople) external pure returns (uint256 personShare) {
        require(totalAmount > 0, "Total amount should be positive number");
        require(numPeople > 0, "Number of People should be positive number");
        require(numPeople < totalAmount, "Number of People can not be bigger than Total amaount.");
    }
}
