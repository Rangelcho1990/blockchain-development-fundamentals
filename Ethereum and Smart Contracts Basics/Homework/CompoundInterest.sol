// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract CompoundInterest {
    uint256 public total;

    event InputRejected(uint256 input, string reason);

    function calculateCompoundInterest(uint256 principal, uint256 rate, uint256 year) public returns (uint256) {
        require(principal > 0, "Loan \"Principal\" should bigger then zero.");
        require(rate > 0 && rate < 101, "Loan \"Rate\" should be between 1 and 100.");
        require(year > 0, "Loan \"Year\" should bigger then zero.");

        total = principal + (principal * rate * year) / 100;

        return total;
    }
}