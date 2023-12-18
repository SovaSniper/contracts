// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Storage {
    address public owner;
    uint256 public amount;

    constructor() {
        owner = msg.sender;
    }

    function store(uint256 _amount) public {
        require(msg.sender == owner, "Only contract Owner can modify amount");
        amount = _amount;
    }

    function get() public view returns (uint256) {
        return amount;
    }
}
