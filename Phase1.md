# Phase 1 - Smart Contract Development

This directory contains the initial smart contract implementation for the NewsNet MVP. It includes:

- `NewsToken.sol` – ERC20 token used for voting and rewards.
- `NewsDAO.sol` – DAO contract that handles story submissions, voting and token distribution.
- Basic tests under `test/` using Hardhat and Chai.
- Deployment script `scripts/deploy.js` for local or testnet deployment.

## Getting Started
1. Install dependencies (requires Node.js). From the project root run:
   ```bash
   npm install
   ```
2. Run the tests:
   ```bash
   npx hardhat test
   ```
3. Deploy to a network (e.g., Sepolia) by configuring credentials in `hardhat.config.js` and running:
   ```bash
   npx hardhat run scripts/deploy.js --network sepolia
   ```

The `NewsDAO` contract should own the `NewsToken` contract so that reward minting can only be performed by the DAO.
