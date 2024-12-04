// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

struct Dog{
    uint256 weight;
    uint256 age;
    // uint256 timestamp;
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

contract Test2 {
    uint256[] public arr = [1, 2, 3, 4, 5];

    mapping (uint256 => uint256) map;

    Dog public bark;

    function checkRes() external view returns (uint256 x) {
        uint256[] memory arrRef = arr;
        arrRef[0] = 2;

        return arr[0]; 
    }

    function checkArr(uint256[] memory _arr) external returns (uint256) {
        _arr[0] = 1;
        arr = _arr;

        return _arr[0];
    }

    function checkArr2(uint256[] calldata _arr) external returns (uint256) {
        // same as checkArr functionality
        // use calldata instead of meory - lower gas fees
        arr = _arr;

        return _arr[0];
    }

    function calculateResult(uint256[] calldata inputs) external pure returns (uint256 result) {
        //not working
        for (uint256 i = 0; 1 < inputs.length; i++) {
            result += inputs[i];
        }
    }

    function dynamicArr( ) external pure {
        // uint256[] memory test1 = new uint256[](length);
        uint256[] memory test1;

        // test1.push(5);
        // arr.pop();
        test1[0];
    }

    function mapTest() external view  {
        mapping (uint256 => uint256) storage mapOne = map;
    }

    function structTest() external view  {
        Dog memory barkCloning = bark; // same as array
    }
}
