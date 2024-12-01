// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract Payroll {
      function calculatePaycheck(uint256 salary, uint256 rating) external pure returns (uint256) {
        require(salary > 0, "Salary should be positive number");

        if (rating > 10 || rating == 0) {
            revert('Rating value is out of range');
        }

        if (rating <= 8) {
            return  salary;
        }

        return salary + ((salary * 10) / 100);
     }
}