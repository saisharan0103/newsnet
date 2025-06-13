// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/// @title NewsToken - ERC20 token used for rewards and voting power
contract NewsToken is ERC20, Ownable {
    /// @notice Constructor mints initial supply to deployer
    /// @param initialSupply Initial token supply minted to owner
    constructor(uint256 initialSupply) ERC20("NewsToken", "NEWS") {
        _mint(msg.sender, initialSupply);
    }

    /// @notice Mint new tokens - only owner (DAO) can call
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }
}
