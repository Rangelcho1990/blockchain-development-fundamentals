// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

contract Crowdfunding {
    mapping(address => uint256) public shares;

    function addShares(address receiver) external {
        shares[receiver] += 100;
    }
}

contract Test {
    uint256[5] public arr = [5,3];

    
    uint256[] public dynamicArr = [1, 2, 3, 4, 5];

    function removeArr() external returns (uint256[] memory) {
        dynamicArr.pop();

        return dynamicArr;
    }

    function addNumber() external view returns (uint256) {
        uint256 res;

        for (uint256 i = 0; i < arr.length; i++) {
            res += arr[i];
        }

        return res;
    }
}
