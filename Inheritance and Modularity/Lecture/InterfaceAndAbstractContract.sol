// SPDX-License-Identifier: MIT

pragma solidity 0.8.28;

interface IAnimal {
    function age() external pure returns (uint256);
}

interface IDog is IAnimal {
    // no modifiers, no is(extend) contract, no override

    function bark() external pure returns (string memory);
}

abstract contract Dog is IDog{
    // external/public
    function bark() public pure returns (string memory){
        return "I'm dog!";
    }
}

abstract contract Sharo is Dog {
    // can not deploy ONLY interface or abstract contract

    function age() public pure returns (uint256){
        return 13;
    }

    function trick() public pure virtual returns (string memory);
}

contract GreatSharo is Sharo {
    // remove virtual, next contracts cannot override the method
    function trick() public pure override returns (string memory){
        return "I can sing!";
    }
}
