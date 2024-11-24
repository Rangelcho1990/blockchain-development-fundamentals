// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract LogError {
    uint256 public total;

    event InputRejected(uint256 input, string reason);

    function errorIsLogget(uint256 principal, uint256 rate, uint256 year) public returns (uint256) {
        if (principal < 1) {
            emit InputRejected(principal, "Loan \"Principal\" should bigger then zero.");

            return total; // Stop execution, error is logget and return the current value of total
        }

        if (rate < 1 || rate > 100) {
            emit InputRejected(rate, "Loan \"Rate\" should be between 1 and 100.");

            return total; // Stop execution, error is logget and return the current value of total
        }

        if (year < 1) {
            emit InputRejected(year, "Loan \"Year\" should bigger then zero.");

            return total; // Stop execution, error is logget and return the current value of total
        }

        total = principal + (principal * rate * year) / 100;
        emit InputRejected(total, "Total is calculated.");

        return total;
    }
}